module Booking
  module Domain
    module Aggregates
      class Cargo < Entity
        attribute :booking_id, Types.Instance(ValueObjects::BookingId).optional.default(nil)
        attribute :booking_amount, Types.Instance(ValueObjects::BookingAmount)
        attribute :route_specification, Types.Instance(ValueObjects::RouteSpecification)
        attribute :cargo_itinerary, Types.Instance(ValueObjects::CargoItinerary)
        attribute :delivery, Types.Instance(ValueObjects::Delivery)

        attribute :location, Types.Instance(Entities::Location)
      end
    end
  end
end
