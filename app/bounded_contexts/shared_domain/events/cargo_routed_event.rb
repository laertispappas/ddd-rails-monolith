module SharedDomain
  module Events
    class CargoRoutedEvent < ValueObject
      attribute :id, Types::String
    end
  end
end
