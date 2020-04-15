class Performance < ApplicationRecord

  ## GET METHODS:
  # GET "CAO_USUARIO" METHOD:
  def self.get_users
    connection = ActiveRecord::Base.connection
    results = connection.exec_query("
      SELECT cao_usuario.co_usuario, no_usuario 
      FROM cao_usuario 
      INNER JOIN permissao_sistema
      ON cao_usuario.co_usuario = permissao_sistema.co_usuario
      WHERE permissao_sistema.co_sistema = 1 
      AND permissao_sistema.in_ativo = 'S' 
      AND permissao_sistema.co_tipo_usuario IN (0, 1, 2) ;
      ")
    return results
  end

  # GET "CAO_FATURA" METHOD:
  def self.get_bills
    connection = ActiveRecord::Base.connection
    results = connection.exec_query("
      SELECT co_fatura , valor, total_imp_inc, data_emissao 
      FROM cao_fatura 
      INNER JOIN cao_os
      USING (co_os)
      WHERE cao_os.co_usuario = 'carlos.arruda' 
      AND data_emissao >='2007-01-01 00:00:00'
      AND data_emissao <'2007-03-01 00:00:00'
      GROUP BY co_fatura ;
      ")
    return results
  end

  ## RELATORIO:
  # CALCULATE "RECEITA LIQUIDA" METHOD:
  def self.set_net_income
    values = get_net_incomes
    @incomes = 0
    values.each do |value|
      @incomes += value["valor"] - (value["valor"] * (value["total_imp_inc"] * 0.01))
    end
    return @incomes
  end

end
