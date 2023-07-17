class Api::V1::WeatherController < ApplicationController
  def index
    current_weather = WeatherFacade.new.weather_by_city_name(params[:city_name])
    render json: ForecastSerializer.new(current_weather)
  end
end