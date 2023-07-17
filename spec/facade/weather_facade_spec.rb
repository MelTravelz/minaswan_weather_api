require 'rails_helper'

RSpec.describe WeatherFacade do
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
    end
  end
end