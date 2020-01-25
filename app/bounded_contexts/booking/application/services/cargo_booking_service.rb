module Booking
  module Application
    module Services
      class CargoBookingService
        # injectable services
        # event dispatcher
        # cargo repository
        # external cargo routing service
        # card booked event
        # card routed event

        def book_cargo(book_cargo_command)
          raise NotImplementedError
        end
      end
    end
  end
end
