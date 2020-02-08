module Booking
  module Application
    module Services
      class ExternalCargoRoutingService
        include AppContainer::Inject[client: "Infrastrructure::ExernalCargoRoutingServiceClient"]

        def fetch_route_for_specification(route_specification)
          transit_path = client.find_optimal_route(
            origin: route_specification.origin.un_loc_code,
            destination: route_specification.destination.un_loc_code,
            arrival_deadline: route_specification.arrival_deadline
          )

          legs = transit_path.edges.map do |edge|
            to_leg(edge)
          end
          CargoItinerary.new(legs: legs)
        end

        private

        def to_leg(edge)
          Leg.new(
            voyage: Voyage.new(edge.voyage_number),
            location: Location.new(edge.from_un_locode),
            unload_location: Location.new(edge.to_un_locode),
            load_time: edge.from_date,
            unload_time: edge.to_date
          )
        end
      end
    end
  end
end
