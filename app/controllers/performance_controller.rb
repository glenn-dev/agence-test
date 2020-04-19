class PerformanceController < ApplicationController

  
  def index
    results = Performance.monthly_report_by_user
    render json: results.to_json
  end

end
