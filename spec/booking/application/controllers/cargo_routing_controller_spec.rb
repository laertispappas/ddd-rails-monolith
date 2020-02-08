require "rails_helper"

module Booking
  module Application
    module Controllers
      RSpec.describe CargoRoutingController, type: :request do
        let(:repo) { Infrastructure::Repositories::CargoRepository.new }
        let(:create_cargo_params) {
          {
            booking_amount: 1,
            origin_location: "ATH",
            dest_location: "HAM",
            dest_arrival_deadline: Time.now.iso8601
          }
        }
        let(:create_cargo_request) { post "/bookings", params: create_cargo_params }
        let(:do_request) { post "/cargorouting", params: { booking_id: cargo.booking_id.value } }
        let(:cargo) do
          create_cargo_request
          repo.get_by_booking_id(JSON.parse(response.body)["value"])
        end

        it "responds with the correct http response" do
          do_request
          expect(response.status).to eq 200
        end
      end
    end
  end
end
