require "rails_helper"

module Booking
  module Application
    module Controllers
      RSpec.describe CargoBookingsController, type: :request do
        let(:path) { "/bookings" }
        let(:params) {{}}
        let(:do_request) { post path, params: params }

        it "responds with the correct http response" do
          do_request
          expect(response.status).to eq 200
        end
      end
    end
  end
end
