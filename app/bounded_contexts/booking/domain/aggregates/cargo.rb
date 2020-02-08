module Booking
  module Domain
    module Aggregates
      class Cargo < Entity
        attribute :booking_id, Types.Instance(ValueObjects::BookingId).optional.default(nil)
        attribute :booking_amount, Types.Instance(ValueObjects::BookingAmount)
        attribute :route_specification, Types.Instance(ValueObjects::RouteSpecification)
        attribute :itinerary, Types.Instance(ValueObjects::CargoItinerary).optional
        attribute :delivery, Types.Instance(ValueObjects::Delivery).optional.default(nil)

        attribute :origin, Types.Instance(Entities::Location)

        def self.from_command(book_cargo_command)
          route_specification = ValueObjects::RouteSpecification.new(
            origin: Entities::Location.new(un_loc_code: book_cargo_command.origin_location),
            destination: Entities::Location.new(un_loc_code: book_cargo_command.dest_location),
            arrival_deadline: book_cargo_command.dest_arrival_deadline
          )
          delivery = ValueObjects::Delivery.derived_from(
            ValueObjects::CargoItinerary::EMPTY,
            ValueObjects::LastCargoHandledEvent::EMPTY
          )
          new(booking_id: ValueObjects::BookingId.new(value: book_cargo_command.booking_id),
              booking_amount: ValueObjects::BookingAmount.new(value: book_cargo_command.booking_amount),
              route_specification: route_specification, origin: route_specification.origin,
              # cargo has not been routed yet
              itinerary: ValueObjects::CargoItinerary::EMPTY,
              delivery: delivery
          )
        end

        def assign_to_route(cargo_itinerary)
          attributes[:itinerary] = cargo_itinerary
        end
      end
    end
  end
end
