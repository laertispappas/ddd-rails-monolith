module Booking
  module Infrastructure
    module Mappers
      module CargoMapper
        module_function

        def to_entity(dao)
          Domain::Aggregates::Cargo.new(
            id: dao.id,
            booking_id: Domain::ValueObjects::BookingId.new(value: dao.booking_id),
            booking_amount: Domain::ValueObjects::BookingAmount.new(value: dao.booking_amount),
            route_specification: Domain::ValueObjects::RouteSpecification.new(
              origin: Domain::Entities::Location.new(name: "TODO", un_loc_code: "TODO"),
              destination: Domain::Entities::Location.new(
                name: "TODO", un_loc_code: "TODO"),
              arrival_deadline: Time.now.to_datetime
            ),
            cargo_itinerary: Domain::ValueObjects::CargoItinerary.new(legs: []),
            delivery: nil,
            location: Domain::Entities::Location.new(name: "TODO", un_loc_code: "TODO"))
        end

        # TODO: rest
        def to_dao(entity)
          {
            booking_id: entity.booking_id&.value,
            booking_amount: entity.booking_amount.value,
            transport_status: "TODO",
            routing_status: "TODO",
          }
        end
      end
    end
  end
end
