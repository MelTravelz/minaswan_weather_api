require 'rails_helper'

RSpec.describe "/api/v1/weather" do
  describe "#index" do
    describe "happy path tests" do
      it "returns a 'weather' type json object" do
        get "/api/v1/weather?location=Istanbul"

        parsed_data = JSON.parse(response.body, symbolize_names: true)
        
        expect(response).to have_http_status(200)

        expect(parsed_data).to be_a(Hash)
      end
    end
  end
end