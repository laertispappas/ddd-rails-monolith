module Booking
  module Domain
    module ValueObjects
      class CargoItinerary < ValueObject
        EMPTY = CargoItinerary.new

        attribute :legs, Types::Array.of(ValueObjects::Leg)
      end
    end
  end
end
