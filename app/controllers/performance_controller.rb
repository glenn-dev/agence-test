class PerformanceController < ApplicationController

  def index
    results = CaoUsuario.find_by_user
    render json: results.to_json
  end

end
