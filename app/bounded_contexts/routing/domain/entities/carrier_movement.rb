module Routing
  module Domain
    module Entities
      class CarrierMovement < Entity
        attribute :arrival_date, Types::Strict::Date
        attribute :departure_Date, Types::Strict::Date
        attribute :arrival_location, Types.Instance(ValueObjects::Location)
        attribute :departure_location, Types.Instance(ValueObjects::Location)
      end
    end
  end
end
