module Tracking
  module Domain
    module Commands
      class AddTrackingEvent < Dry::Struct
        attribute :booking_id, Types::String
        attribute :event_time, Types::DateTime
        attribute :event_type, Types::String
        attribute :location, Types::String
        attribute :voyage_number, Types::String
      end
    end
  end
end
