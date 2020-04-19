class PerformanceController < ApplicationController

  
  def index
    @reports = Performance.monthly_report_by_user
    #render json: @reports.to_json
  end

end
