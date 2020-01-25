module Booking
  module Application
    module Services
      class CargoBookingService
        include AppContainer::Inject[
          event_dispatcher: "shared.event_dispatcher",
          cargo_repository: "booking.cargo_repository",
          cargo_routing_service: "booking.cargo_routing_service"
        ]

        def book_cargo(book_cargo_command)
          raise NotImplementedError
        end
      end
    end
  end
end
