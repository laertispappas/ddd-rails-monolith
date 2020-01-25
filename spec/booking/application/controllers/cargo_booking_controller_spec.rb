require "rails_helper"

module Booking
  module Application
    module Controllers
      RSpec.describe CargoBookingsController, type: :request do
        let(:path) { "/bookings" }
        let(:params) {
          {
            booking_amount: 1,
            origin_location: "ATH",
            dest_location: "HAM",
            dest_arrival_deadline: Time.now.iso8601
          }
        }
        let(:do_request) { post path, params: params }

        it "responds with the correct http response" do
          do_request
          expect(response.status).to eq 200
        end
      end
    end
  end
end
