require 'rails_helper'

RSpec.describe "/api/v1/weather", :vcr, type: :request do
  describe "#index" do
    describe "happy path tests" do
      it "returns a 'weather' type json object" do
        VCR.use_cassette('weather_service') do
          get "/api/v1/weather?city_name=Istanbul"

          parsed_data = JSON.parse(response.body, symbolize_names: true)

          expect(response).to have_http_status(200)

          expect(parsed_data).to be_a(Hash)
          expect(parsed_data[:data]).to be_a(Hash)
          expect(parsed_data[:data].keys).to eq([:id, :type, :attributes])

          expect(parsed_data[:data][:id]).to eq(nil)
          expect(parsed_data[:data][:type]).to eq("weather")
          expect(parsed_data[:data][:attributes]).to be_a(Hash)
          expect(parsed_data[:data][:attributes].keys).to eq([:city, :local_time, :temp_f, :temp_c])
        end
      end
    end
  end
end
