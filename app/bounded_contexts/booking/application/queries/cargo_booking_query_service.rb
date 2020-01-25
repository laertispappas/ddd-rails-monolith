module Booking
  module Application
    module Queries
      class CargoBookingQueryService
        include AppContainer::Inject[repository: "booking.cargo_repository"]

        def find_all
          repository.find_all
        end

        def find_all_booking_ids
          repository.find_all_booking_ids
        end

        def find(booking_id)
          repository.find(Domain::ValueObjects::BookingId.new(value: booking_id))
        end
      end
    end
  end
end
