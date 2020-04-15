class PerformanceController < ApplicationController

  def index
    results = Performance.get_bills
    render json: results.to_json
  end

end
