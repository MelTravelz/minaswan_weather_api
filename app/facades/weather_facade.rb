require "ostruct"

class WeatherFacade
  attr_reader :weather_service

  def initialize
    @weather_service = WeatherService.new
  end

  def weather_by_city_name(city_name)
    all_weather_info = @weather_service.fetch_all_weather_info(city_name)
    time = all_weather_info[:location][:localtime]
    temp_in_f = all_weather_info[:current][:temp_f]

    weather_info_hash = {
      city: city_name, 
      local_time: time,
      temp_f: temp_in_f,
      temp_c: convert_to_c(temp_in_f) #here we are pretending that the endpoint did not provide temp in C:
    }
    
    OpenStruct.new(weather_info_hash)
  end

  def convert_to_c(temp_in_f)
    celsius = (temp_in_f - 32) * 5/9
    celsius.round(1)
  end
end