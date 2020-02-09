module Routing
  module Domain
    module Aggregates
      class Voyage < Entity
        attribute :schedule, Types.Instance(ValueObjects::Schedule)
        attribute :voyage_number, Types.Instance(ValueObjects::VoyageNumber)
      end
    end
  end
end
