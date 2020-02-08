module Booking
  module Infrastructure
    module Services
      class ExternalCargoRoutingServiceClient
        include Booking::AppContainer::Inject[client: "shared.http_client"]

        # Demonstration path
        API_PATH = 'https://api.spotify.com/v1/search'

        FAKE_ROUTES = {
          edges: [
            {
              voyage_number: "voyage_number edge 1",
              from_un_locode: "ATH",
              to_un_locode: "HAM",
              from_date: 1.day.from_now.iso8601,
              to_date: 1.week.from_now.iso8601
            },
            {
              voyage_number: "voyage_number ecge 2",
              from_un_locode: "HAM",
              to_un_locode: "LIS",
              from_date: 1.weeks.from_now.iso8601,
              to_date: 2.weeks.from_now.iso8601
            }
          ]
        }

        # Make external http call to find th optimal route path
        # transform the response to our shared domain entities.
        # The external call is also a subject to point the anti-corruption layer in ddd.
        # We don't want to delegate to the rest of the domain the response from the external
        # service. Instead we need to either return domain entities or facade DTOs internally
        # defined in our domain.
        #
        def find_optimal_route(origin:, destination:, arrival_deadline:)
          params = { origin: origin, destination: destination, deadline: arrival_deadline }
          to_transit_path(client.get(API_PATH, params))
        end

        private

        def to_transit_path(_json)
          edges = FAKE_ROUTES[:edges].map { |edge| to_transit_edge(edge) }
          SharedDomain::Model::TransitPath.new(edges: edges)
        end

        def to_transit_edge(edge)
          SharedDomain::Model::TransitEdge.new(
            voyage_number: edge[:voyage_number],
            from_un_locode: edge[:from_un_locode],
            to_un_locode: edge[:to_un_locode],
            from_date: edge[:from_date].to_datetime,
            to_date: edge[:to_date].to_datetime
          )
        end
      end
    end
  end
end
