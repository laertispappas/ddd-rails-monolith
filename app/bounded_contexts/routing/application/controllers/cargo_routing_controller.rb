module Routing
  module Application
    module Controllers
      class CargoRoutingController < SharedDomain::Application::Controllers::ApplicationController
        include Routing::Container::Inject[
          query: "routing.cargo_routing_query"
        ]

        # GET /optimal_route
        def find_optimal_route
          voyages = query.find_all
          transit_edges = voyages.flat_map do |voyage|
            voyage.schedule.carrier_movements.flat_map do |movement|
              SharedDomain::Model::TransitEdge.new(
                voyage_number: voyage.voyage_number.value,
                from_date: movement.arrival_date,
                to_date: movement.departure_date,
                from_un_locode: movement.arrival_location.un_loc_code,
                to_un_locode: movement.departure_location.un_loc_code
              )
            end
          end

          transit_path = SharedDomain::Model::TransitPath.new(edges: transit_edges)
          render json: transit_path
        end
      end
    end
  end
end
