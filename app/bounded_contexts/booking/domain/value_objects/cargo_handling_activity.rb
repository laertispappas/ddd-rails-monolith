module Booking
  module Domain
    module ValueObjects
      class CargoHandlingActivity < ValueObject
        attribute :type, Types::String
        attribute :location, Types.Instance(Entities::Location)
        attribute :voyage, Types.Instance(ValueObjects::Voyage).optional
      end
    end
  end
end
