module Booking
  module Domain
    module ValueObjects
      class Leg < ValueObject
        attribute :voyage, Types.Instance(Voyage)
        attribute :load_location, Types.Instance(Entities::Location)
        attribute :unload_location, Types.Instance(Entities::Location)
        attribute :load_time, Types::DateTime
        attribute :unload_time, Types::DateTime
      end
    end
  end
end
