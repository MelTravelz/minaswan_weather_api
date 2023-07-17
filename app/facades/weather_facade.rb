class WeatherFacade
  attr_reader :weather_service

  def initialize
    @weather_service = WeatherService.new
  end
end