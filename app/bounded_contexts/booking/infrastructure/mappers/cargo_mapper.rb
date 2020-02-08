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
            route_specification: to_route_specification_entity,
            itinerary: Domain::ValueObjects::CargoItinerary.new(legs: to_leg_entity(dao)),
            delivery: to_delivery_entity(dao),
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

        private def to_leg_entity(dao)
          dao.legs.map do |leg_dao|
            LegMapper.to_entity(leg_dao)
          end
        end

        private def to_route_specification_entity
          Domain::ValueObjects::RouteSpecification.new(
            origin: Domain::Entities::Location.new(name: "TODO", un_loc_code: "TODO"),
            destination: Domain::Entities::Location.new(
              name: "TODO", un_loc_code: "TODO"),
            arrival_deadline: Time.now.to_datetime
          )
        end

        private def to_delivery_entity(cargo_dao)
          Domain::ValueObjects::Delivery.new(
            routing_status: cargo_dao.routing_status, transport_status: cargo_dao.transport_status,
            last_known_location: nil, current_voyage: nil, # TODO
            last_event: Domain::ValueObjects::LastCargoHandledEvent::EMPTY # TODO
          )
        end
      end
    end
  end
end
