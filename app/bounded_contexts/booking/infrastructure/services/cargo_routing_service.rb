module Booking
  module Infrastructure
    module Services
      class CargoRoutingService
        include Booking::AppContainer::Inject[
          client: "shared.http_client"
        ]

        API_PATH = 'https://api.spotify.com/v1/search'

        def find_optimal_route(origin:, destination:, arrival_deadline:)
          params = { origin: origin, destination: destination, deadline: arrival_deadline }
          client.get(API_PATH, params)
        end
      end
    end
  end
end
