module SharedDomain
  module Events
    class CargoBookedEvent < ValueObject
      attribute :id, Types::String
    end
  end
end
