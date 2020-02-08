module Booking
  module Application
    module Services
      class CargoBooking
        include AppContainer::Inject[
          event_dispatcher: "shared.event_dispatcher",
          cargo_repository: "booking.cargo_repository",
          external_cargo_routing_service: "booking.external_cargo_routing_service"
        ]

        def book_cargo(book_cargo_command)
          booking_id = cargo_repository.next_booking_id
          book_cargo_command.set_booking_id(booking_id)
          cargo = Domain::Aggregates::Cargo.from_command(book_cargo_command)

          cargo_repository.store(cargo)
          cargo_repository.commit!

          event_dispatcher.emit(SharedDomain::Events::CargoBookedEvent.new(id: booking_id))

          Domain::ValueObjects::BookingId.new(value: booking_id)
        end

        def assign_route_to_cargo(route_cargo_command)
          booking_id = Domain::ValueObjects::BookingId.new(value: route_cargo_command.booking_id)
          cargo = cargo_repository.get_by_booking_id(booking_id.value)

          itinerary = external_cargo_routing_service.
            fetch_route_for_specification(cargo.route_specification)

          cargo.assign_to_route(itinerary)
          cargo_repository.update(cargo)
          cargo_repository.commit!

          cargo_routed_event = SharedDomain::Events::CargoRoutedEvent.new(
            booking_id: route_cargo_command.booking_id
          )
          event_dispatcher.emit(cargo_routed_event)
        end
      end
    end
  end
end
