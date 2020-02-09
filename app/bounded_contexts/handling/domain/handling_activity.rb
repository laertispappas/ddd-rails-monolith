module Handling
  module Domain
    class HandlingActivity < Entity
      attribute :event_type, TYPES
      attribute :voyage_number, Types::Strict::String
      attribute :location_un_loc_code, Types::Strict::String
      attribute :completion_time, Types::Strict::DateTime
      attribute :cargo_booking_id, Types::Strict::String
    end
  end
end
