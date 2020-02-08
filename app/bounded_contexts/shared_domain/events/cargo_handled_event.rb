module SharedDomain
  module Events
    class CargoHandledEvent < ValueObject
      attribute :booking_id, Types::String
      attribute :handling_type, Types::String
      attribute :handling_completion_time, Types::DateTime
      attribute :handling_location, Types::String
      attribute :voyage_number, Types::String
    end
  end
end
