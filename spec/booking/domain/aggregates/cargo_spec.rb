require "rails_helper"

module Booking
  module Domain
    RSpec.describe Booking::Domain::Aggregates::Cargo, type: :model do
      let(:cargo) {
        described_class.new(
          booking_id: booking_id, booking_amount: booking_amount,
          location: location
        )
      }
      let(:booking_id) { ValueObjects::BookingId.new(value: "bookingid") }
      let(:booking_amount) { ValueObjects::BookingAmount.new(value: 123) }
      let(:location) { Entities::Location.new(name: "LA", un_loc_code: "code") }

      it { expect(cargo).to be_present }
    end
  end
end

