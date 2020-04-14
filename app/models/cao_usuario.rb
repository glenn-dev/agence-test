class CaoUsuario < ApplicationRecord

  def self.find_by_user
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query('SELECT no_usuario FROM cao_usuario INNER JOIN permissao_sistema
      ON cao_usuario.co_usuario = permissao_sistema.co_usuario
      WHERE permissao_sistema.co_sistema = 1 AND 
      permissao_sistema.in_ativo = "S" AND 
      permissao_sistema.co_tipo_usuario = 1 ;')
    return results
  end

end
