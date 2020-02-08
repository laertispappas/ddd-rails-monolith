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
            itinerary: Domain::ValueObjects::CargoItinerary.new(legs: map_legs(dao)),
            delivery: Domain::ValueObjects::Delivery.new(
              routing_status: dao.routing_status, transport_status: dao.transport_status,
              last_known_location: nil, current_voyage: nil, # TODO
              last_event: Domain::ValueObjects::LastCargoHandledEvent::EMPTY # TODO
            ),
            origin: Domain::Entities::Location.new(un_loc_code: "TODO"),
            location: Domain::Entities::Location.new(un_loc_code: "TODO"))
        end

        # TODO: rest
        def to_dao(entity)
          {
            booking_id: entity.booking_id.value,
            booking_amount: entity.booking_amount.value,
            transport_status: entity.delivery.transport_status,
            routing_status: entity.delivery.routing_status,
            spec_origin_id: entity.route_specification.origin.un_loc_code,
            spec_destination_id: entity.route_specification.destination.un_loc_code,
            spec_arrival_deadline: entity.route_specification.arrival_deadline,
            origin_id: entity.origin.un_loc_code,
          }
        end

        def map_legs(dao)
          dao.legs.map do |leg_dao|
            Domain::ValueObjects::Leg.new(
              voyage: Domain::ValueObjects::Voyage.new(number: leg_dao.voyage_number),
              load_location: Domain::Entities::Location.new(un_loc_code: leg_dao.load_location_id),
              unload_location: Domain::Entities::Location.new(un_loc_code: leg_dao.unload_location_id),
              load_time: leg_dao.load_time.to_datetime,
              unload_time: leg_dao.unload_time.to_datetime
            )
          end
        end
      end
    end
  end
end
