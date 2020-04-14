class PerformanceController < ApplicationController

  def index
    results = Performance.find_by_user
    render json: results.to_json
  end

end
