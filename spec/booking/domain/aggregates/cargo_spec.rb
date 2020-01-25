require "rails_helper"

module Booking
  module Domain
    RSpec.describe Booking::Domain::Aggregates::Cargo, type: :model do
      let(:cargo) {
        described_class.new(
          booking_id: booking_id, booking_amount: booking_amount,
          location: location,
          route_specification: route_specification,
          cargo_itinerary: cargo_itinerary
        )
      }
      let(:arrival_deadline) { DateTime.new }
      let(:booking_id) { ValueObjects::BookingId.new(value: "bookingid") }
      let(:booking_amount) { ValueObjects::BookingAmount.new(value: 123) }
      let(:location) { Entities::Location.new(name: "LA", un_loc_code: "code") }
      let(:route_specification) {
        ValueObjects::RouteSpecification.new(origin: location, destination: location, arrival_deadline: arrival_deadline)
      }
      let(:voyage) { ValueObjects::Voyage.new(number: "AB-123") }
      let(:cargo_itinerary) {
        ValueObjects::CargoItinerary.new(legs: [
          ValueObjects::Leg.new(id: 1, voyage: voyage, load_location: location,
                                unload_location: location, load_time: DateTime.new,
                                unload_time: DateTime.new)
        ])
      }

      it { expect(cargo).to be_present }
    end
  end
end

