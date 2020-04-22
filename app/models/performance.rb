class Performance < ApplicationRecord

  ## GET QUERYS:
  # GET USERS QUERY:
  def self.get_users
    users = ActiveRecord::Base.connection.exec_query("
      SELECT cao_usuario.co_usuario, no_usuario 
      FROM cao_usuario 
      INNER JOIN permissao_sistema
      ON cao_usuario.co_usuario = permissao_sistema.co_usuario
      WHERE permissao_sistema.co_sistema = 1 
      AND permissao_sistema.in_ativo = 'S' 
      AND permissao_sistema.co_tipo_usuario IN (0, 1, 2) 
      ORDER BY no_usuario ;
      ")
    return users
  end

  # GET BILLS DATA QUERY:
  def self.get_bills(users, start_date, end_date)
    bills = ActiveRecord::Base.connection.exec_query("
      SELECT 
	      co_fatura, 
	      valor, 
	      total_imp_inc, 
	      data_emissao, 
	      comissao_cn, 
        cao_usuario.no_usuario,
        cao_os.co_usuario
      FROM cao_fatura 
      INNER JOIN cao_os
      ON cao_fatura.co_os = cao_os.co_os
      INNER JOIN cao_usuario 
      ON cao_usuario.co_usuario = cao_os.co_usuario
      WHERE cao_os.co_usuario IN (#{users})
      AND data_emissao >= '#{start_date}'
      AND data_emissao < '#{end_date}'
      ORDER BY data_emissao ;
      ")
    return bills
  end

  # GET FIXED COST QUERY:
  def self.get_fixed_cost(user)
    fixed_cost = ActiveRecord::Base.connection.exec_query("
      SELECT brut_salario 
      FROM cao_salario
      WHERE co_usuario IN('#{user}') ;
    ")
    if fixed_cost[0] != nil
      return fixed_cost[0]["brut_salario"]
    else
      fixed_cost = 0
      return fixed_cost
    end
  end

  ## RELATORIO:
  # GROUP BILLS BY USER METHOD:
  def self.users_billing(users, start_date, end_date)
    bills = get_bills(users, start_date, end_date)
    users_report = {}
    users_report = bills.group_by { |bill| bill["no_usuario"] }.map { |user, bills| {user: user, report: bills }}
    return users_report
  end

  # SET MONTHLY REPORT BY USER METHOD
  def self.monthly_report_by_user(users, date1, date2)
    start_date = Time.parse("#{date1} 23:59:59").strftime("%Y-%m-%d %T")
    end_date = Time.parse("#{date2} 23:59:59").strftime("%Y-%m-%d %T")
    reports_by_users = users_billing(users, start_date, end_date)
    monthly_report_by_user = []

    reports_by_users.map { |billing|
      fixed_cost = get_fixed_cost(billing[:report][0]["co_usuario"])

      monthly_report = billing[:report].group_by {
        |dis_bills| dis_bills["data_emissao"].strftime("%m-%Y") }.map { |date, ord_bills|
        income = 0
        commission = 0
        profit = 0

        ord_bills.map { |bill|
          income += bill["valor"] - (bill["valor"] * (bill["total_imp_inc"] * 0.01))
          commission += (bill["valor"] - (bill["valor"] * (bill["total_imp_inc"] * 0.01))) * (bill["comissao_cn"] * 0.01)
        }

        profit = income - (fixed_cost + commission)
        final_calculation = { month: date, net_income: income.round(2), fixed_cost: fixed_cost.round(2), commission: commission.round(2), profit: profit.round(2) }
        }
        inc = 0
        cost = 0
        com = 0
        prof = 0
        monthly_report.each { |month| 
          inc += month[:net_income]
          cost += month[:fixed_cost]
          com += month[:commission]
          prof += month[:profit]
        }
        monthly_report << { month: 'SALDO:', net_income: inc.round(2), fixed_cost: cost.round(2), commission: com.round(2), profit: prof.round(2) }

        monthly_report_by_user << { user: billing[:user], report: monthly_report }
      }
      return monthly_report_by_user
  end
end
