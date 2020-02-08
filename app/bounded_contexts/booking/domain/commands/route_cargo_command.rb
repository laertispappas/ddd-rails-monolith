module Booking
  module Domain
    module Commands
      class RouteCargoCommand < Dry::Struct
        attribute :booking_id, Types::String
      end
    end
  end
end
