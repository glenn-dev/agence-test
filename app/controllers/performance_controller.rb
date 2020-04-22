class PerformanceController < ApplicationController
  
  def index
    @users = Performance.get_users
  end

  def get_data
    @data = Performance.monthly_report_by_user(params[:users], params[:date1], params[:date2])
    respond_to do |format|
      format.json { render json: @data }
    end
  end

  def relatorio
    @reports = Performance.monthly_report_by_user(params[:users], params[:date1], params[:date2])
    respond_to do |format|
      format.js
    end
  end

end
