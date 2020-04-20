class Performance < ApplicationRecord

  ## GET METHODS:
  # GET USERS METHOD:
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

  # GET BILLS DATA METHOD:
  def self.get_bills
    # PSEUDO PARAMS:
    bills = ActiveRecord::Base.connection.exec_query("
      SELECT 
	      co_fatura, 
	      valor, 
	      total_imp_inc, 
	      data_emissao, 
	      comissao_cn, 
	      cao_usuario.no_usuario,
	      cao_salario.brut_salario 
      FROM cao_fatura 
      INNER JOIN cao_os
      INNER JOIN cao_usuario 
      INNER JOIN cao_salario
      ON cao_os.co_usuario = cao_usuario.co_usuario 
      AND cao_fatura.co_os = cao_os.co_os
      AND cao_salario.co_usuario = cao_usuario.co_usuario
      WHERE cao_os.co_usuario IN (#{@users})
      AND data_emissao >= '#{@date1}'
      AND data_emissao < '#{@date2}'
      ORDER BY data_emissao ;
      ")
    return bills
  end

  # GET FIXED COST METHOD:
  def self.get_fixed_cost
    # PSEUDO PARAMS:
    #users = "'carlos.arruda', 'renato.pereira', 'anapaula.chiodaro', 'felipe.chahad', 'bruno.freitas'"
    fixed_cost = ActiveRecord::Base.connection.exec_query("
      SELECT brut_salario 
      FROM cao_salario
      WHERE co_usuario IN(#{@users}) ;
      ")
    return fixed_cost
  end

  ## RELATORIO:
  # GROUP BILLS BY USER METHOD:
  def self.users_billing
    bills = get_bills
    users_report = {}
    users_report = bills.group_by { |bill| bill["no_usuario"] }.map { |user, bills| {user: user, report: bills }}
    return users_report
  end

  # SET MONTHLY REPORT BY USER METHOD
  def self.monthly_report_by_user(users, start_date, end_date)
    @users = users
    @date1 = Time.parse("#{start_date} 23:59:59").strftime("%Y-%m-%d %T")
    @date2 = Time.parse("#{end_date} 23:59:59").strftime("%Y-%m-%d %T")
    reports_by_users = users_billing
    monthly_report_by_user = []

    reports_by_users.map { |billing|

      monthly_report = billing[:report].group_by {
        |dis_bills| dis_bills["data_emissao"].strftime("%m-%Y")
      }.map { |date, ord_bills|
        income = 0
        commission = 0
        profit = 0
        fixed_cost = 0
        ord_bills.map { |bill|
          fixed_cost = bill["brut_salario"]
          income += bill["valor"] - (bill["valor"] * (bill["total_imp_inc"] * 0.01))
          commission += (bill["valor"] - (bill["valor"] * (bill["total_imp_inc"] * 0.01))) * (bill["comissao_cn"] * 0.01)
        } 
        profit = income - (fixed_cost + commission)
        final_calculation = { month: date, net_income: income.round(2), fixed_cost: fixed_cost.round(2), commission: commission.round(2), profit: profit.round(2) }
        }
        monthly_report_by_user << { user: billing[:user], report: monthly_report }
      }
      return monthly_report_by_user
  end
end
