class PerformanceController < ApplicationController

  def index
    results = Performance.set_monthly_report
    render json: results.to_json
  end

end
