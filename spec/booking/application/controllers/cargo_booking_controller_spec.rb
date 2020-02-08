require "rails_helper"

module Booking
  module Application
    module Controllers
      RSpec.describe CargoBookingsController, type: :request do
        let(:repo) { Infrastructure::Repositories::CargoRepository.new }
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

        it "responds with the correct body" do
          do_request

          json = JSON.parse(response.body)
          expect(json["value"]).to be_present
          expect(repo.get_by_booking_id(json["value"])).to be_a(Domain::Aggregates::Cargo)
        end
      end
    end
  end
end
