module Booking
  module Domain
    module ValueObjects
      class LastCargoHandledEvent < ValueObject
        attribute :handling_event_id, Types::String.optional.default(nil)
        attribute :handling_event_type, Types::String.optional.default(nil)
        attribute :handling_event_voyage, Types::String.optional.default(nil)
        attribute :handling_event_location, Types::String.optional.default(nil)

        EMPTY = LastCargoHandledEvent.new
      end
    end
  end
end
