module Booking
  module Domain
    module Commands
      class BookCargoCommand < Dry::Struct
        attribute :booking_id, Types::String.optional.default(nil)
        attribute :booking_amount, Types::Integer
        attribute :origin_location, Types::String
        attribute :dest_location, Types::String
        attribute :dest_arrival_deadline, Types::DateTime

        def set_booking_id(id)
          attributes[:booking_id] = id
        end
      end
    end
  end
end
