class WeatherService
  def fetch_all_weather_info(city_name)
    response = conn.get("v1/forecast.json") do |faraday|
      faraday.params["q"] = city_name
      faraday.params["days"] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def conn
    Faraday.new(url: "http://api.weatherapi.com/") do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers["key"] = ENV["WEATHER_API_KEY"]
    end
  end
end