module Booking
  module Domain
    module ValueObjects
      class RouteSpecification < ValueObject
        attribute :origin, Types.Instance(Entities::Location)
        attribute :destination, Types.Instance(Entities::Location)
        attribute :arrival_deadline, Types::DateTime
      end
    end
  end
end
