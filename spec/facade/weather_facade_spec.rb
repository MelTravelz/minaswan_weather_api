require 'rails_helper'

RSpec.describe WeatherFacade, :vcr, type: :facade  do
  describe "instance methods" do
    before(:each) do
      @weather_facade = WeatherFacade.new
    end

    describe "happy path tests" do
      describe "#initialize" do
        it "exists & creates an instance of WeatherService" do
          expect(@weather_facade).to be_a(WeatherFacade)
          expect(@weather_facade.weather_service).to be_a(WeatherService)
        end
      end

      describe "#weather_by_city_name", :vcr do
        it "returns city name, local time & weather in F and C" do
          VCR.use_cassette('weather_service') do
            expected = OpenStruct.new(
              city: "Istanbul",
              local_time: "2023-07-17 20:42",
              temp_f: 78.8,
              temp_c: 26.0
            )
            weather_by_city = @weather_facade.weather_by_city_name("Istanbul")

            expect(weather_by_city).to be_an(OpenStruct)
            expect(weather_by_city).to eq(expected)
            expect(weather_by_city.id).to eq(nil)
          end
        end
      end

      describe "#convert_to_c" do
        it "returns city name, local time & weather in F and C" do
            expect(@weather_facade.convert_to_c(78.8)).to eq(26.0)
        end
      end
    end
  end
end