module Booking
  module Domain
    module Commands
      class RouteCargoCommand < Dry::Struct
        attribute :booking_id, Types::String.optional.default(nil)
      end
    end
  end
end
