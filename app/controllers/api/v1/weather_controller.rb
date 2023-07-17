class Api::V1::WeatherController < ApplicationController
  def index
    current_weather = WeatherFacade.new.find_weather_by_location(params[:location])
    render json: ForecastSerializer.new(current_weather)
  end
end