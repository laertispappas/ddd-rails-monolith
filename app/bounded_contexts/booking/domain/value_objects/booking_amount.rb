module Booking
  module Domain
    module ValueObjects
      class BookingAmount < ValueObject
        attribute :value, Types::Integer
      end
    end
  end
end
