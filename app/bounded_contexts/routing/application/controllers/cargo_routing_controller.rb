module Routing
  module Application
    module Controllers
      class CargoRoutingController < SharedDomain::Application::Controllers::ApplicationController
        include Routing::Container::Inject[
          query: "routing.cargo_routing_query"
        ]

        # GET /optimal_route
        def find_optimal_route
          # origin, destination, deadline
          voyages = query.find_all

          transit_edges = voyages.map do |voyage|
            movement = voyage.schedule.carrier_movements[0]
            TransitEdge.new(
              voyage_number: voyage.voyage_number.value,
              from_date: movement.arrival_date,
              to_date: movement.departure_date,
              from_un_loc_code: movement.arrival_location.un_loc_code,
              to_un_loc_code: movement.departure_location.un_loc_code
            )
          end

          transit_path = SharedDomain::Model::TransitPath.new(edges: transit_edges)
          render json: transit_path
        end
      end
    end
  end
end
