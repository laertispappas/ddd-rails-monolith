module SharedDomain
  module Model
    class TransitEdge < ValueObject
      attribute :voyage_number, Types::String
      attribute :from_un_locode, Types::String
      attribute :to_un_locode, Types::String
      attribute :from_date, Types::DateTime
      attribute :to_date, Types::DateTime
    end
  end
end
