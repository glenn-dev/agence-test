class PerformanceController < ApplicationController

  def index
    results = Performance.get_users
    render json: results.to_json
  end

end
