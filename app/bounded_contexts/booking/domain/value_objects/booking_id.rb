module Booking
  module Domain
    module ValueObjects
      class BookingId < ValueObject
        attribute :value, Types::String
      end
    end
  end
end
