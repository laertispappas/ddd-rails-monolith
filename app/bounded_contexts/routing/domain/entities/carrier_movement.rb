module Routing
  module Domain
    module Entities
      class CarrierMovement < Entity
        attribute :arrival_date, Types::Strict::DateTime
        attribute :departure_date, Types::Strict::DateTime
        attribute :arrival_location, Types.Instance(ValueObjects::Location)
        attribute :departure_location, Types.Instance(ValueObjects::Location)
      end
    end
  end
end
