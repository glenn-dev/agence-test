class PerformanceController < ApplicationController
  # before_action :reports_params, only: [:relatorio, :grafico, :pizza]
  
  def index
    @users = Performance.get_users
    #render json: @reports.to_json
  end

  def relatorio
    @reports = Performance.monthly_report_by_user(params[:users], params[:date1], params[:date2])
    respond_to do |format|
      format.js
    end
  end

  def grafico
    @reports = Performance.monthly_report_by_user(params[:users], params[:date1], params[:date2])
    respond_to do |format|
      format.json { render json: @reports }
    end
  end

  def pizza
    @reports = Performance.monthly_report_by_user(params[:users], params[:date1], params[:date2])
    respond_to do |format|
      format.js
    end
  end

  private

  def reports_params
    params.require(:performance).permit(:users, :date1, :date2)
  end

end
