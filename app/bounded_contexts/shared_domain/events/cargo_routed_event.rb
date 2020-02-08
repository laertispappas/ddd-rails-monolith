module SharedDomain
  module Events
    class CargoRoutedEvent < ValueObject
      attribute :booking_id, Types::String
    end
  end
end
