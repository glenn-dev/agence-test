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
  def self.get_bills #Params: users, date1, date2
    bills = ActiveRecord::Base.connection.exec_query("
      SELECT co_fatura, valor, total_imp_inc, data_emissao, comissao_cn
      FROM cao_fatura 
      INNER JOIN cao_os
      USING (co_os)
      WHERE cao_os.co_usuario = 'carlos.arruda' 
      AND data_emissao >='2007-01-01 00:00:00'
      AND data_emissao <'2007-03-01 00:00:00'
      ORDER BY data_emissao ;
      ")
    return bills
  end

  # GET FIXED COST METHOD:
  def self.get_fixed_cost # Params: users
    fixed_cost = ActiveRecord::Base.connection.exec_query("
      SELECT brut_salario 
      FROM cao_salario
      WHERE co_usuario = 'carlos.arruda' ;
      ")
    return fixed_cost
  end

  ## RELATORIO:
  # CALCULATE MONTHLY REPORT BY USERS (RELATORIO) METHOD:
  def self.set_monthly_report
    bills = get_bills
    fixed_cost = get_fixed_cost[0]["brut_salario"]
    net_income_accum = 0
    commission_accum = 0
    current_month = ''
    monthly_report = []
    
    bills.each_with_index do |bill, index|
      if current_month == bill["data_emissao"].strftime("%Y-%m")
        net_income_accum += bill["valor"] - (bill["valor"] * (bill["total_imp_inc"] * 0.01))
        commission_accum += (bill["valor"] - (bill["valor"] * (bill["total_imp_inc"] * 0.01))) * (bill["comissao_cn"] * 0.01)
        current_month = bill["data_emissao"].strftime("%Y-%m")
        monthly_report << { month: current_month, net_income: net_income_accum.round(2), commission: commission_accum.round(2) } if index === (bills.length - 1) 
      else
        monthly_report << { month: current_month, net_income: net_income_accum.round(2), commission: commission_accum.round(2) } if index != 0 || index === (bills.length - 1)
        current_month = bill["data_emissao"].strftime("%Y-%m")
        net_income_accum = bill["valor"] - (bill["valor"] * (bill["total_imp_inc"] * 0.01))
        commission_accum = (bill["valor"] - (bill["valor"] * (bill["total_imp_inc"] * 0.01))) * (bill["comissao_cn"] * 0.01)
      end
    end

    monthly_report.each do |month|
      month[:fixed_cost] = fixed_cost
      month[:profit] = month[:net_income] - (month[:commission] + fixed_cost)
    end
    
    return monthly_report
  end

end
