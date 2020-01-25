module Booking
  module Domain
    module ValueObjects
      class Voyage < ValueObject
        attribute :number, Types::String
      end
    end
  end
end
