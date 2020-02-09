module Routing
  module Domain
    module ValueObjects
      class Schedule < ValueObject
        attribute :carrier_movements,
          Types::Array.of(Entities::CarrierMovement)

        EMPTY = Schedule.new(carrier_movements: [].freeze)
      end
    end
  end
end
