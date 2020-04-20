class PerformanceController < ApplicationController
  before_action :set_reports, only: [:relatorio, :grafico, :pizza]
  
  def index
    @users = Performance.get_users
    #render json: @reports.to_json
  end

  def relatorio
  end

  def grafico
  end

  def pizza
  end

  private

  def set_reports
    @reports = Performance.monthly_report_by_user
    # (params[:users, :date1, :date2])
  end
  # @communication = Communication.find(params[:id])

  # def reports_params
  #   params.require(:communication).permit(:users, :date1, :date2)
  # end

end
