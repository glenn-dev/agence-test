class PerformanceController < ApplicationController

  
  def index
    results = Performance.get_fixed_cost
    render json: results.to_json
  end

end
