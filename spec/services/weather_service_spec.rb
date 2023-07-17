require 'rails_helper'

RSpec.describe WeatherService, :vcr, type: :request do
  describe "instance methods" do
    describe "#fetch_temp" do
      it "returns json object" do
        VCR.use_cassette('weather_service') do
          response = WeatherService.new.fetch_temp("Istanbul")

          expect(response).to be_a(Hash)
          expect(response.keys).to eq([:location, :current, :forecast])
        end
      end
    end
  end
end