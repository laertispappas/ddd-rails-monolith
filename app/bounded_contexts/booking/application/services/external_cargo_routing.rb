module Booking
  module Application
    module Services
      class ExternalCargoRouting
        include AppContainer::Inject[client: "booking.external_cargo_routing_service_client"]

        def fetch_route_for_specification(route_specification)
          transit_path = client.find_optimal_route(
            origin: route_specification.origin.un_loc_code,
            destination: route_specification.destination.un_loc_code,
            arrival_deadline: route_specification.arrival_deadline
          )

          legs = transit_path.edges.map do |edge|
            to_leg(edge)
          end

          Domain::ValueObjects::CargoItinerary.new(legs: legs)
        end

        private

        def to_leg(edge)
          Domain::ValueObjects::Leg.new(
            voyage: Domain::ValueObjects::Voyage.new(number: edge.voyage_number),
            load_location: Domain::Entities::Location.new(un_loc_code: edge.from_un_locode),
            unload_location: Domain::Entities::Location.new(un_loc_code: edge.to_un_locode),
            load_time: edge.from_date,
            unload_time: edge.to_date
          )
        end
      end
    end
  end
end
