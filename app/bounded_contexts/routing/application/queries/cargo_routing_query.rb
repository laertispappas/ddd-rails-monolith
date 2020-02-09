module Routing
  module Application
    module Queries
      class CargoRoutingQuery
        include Routing::Container::Inject[
          voyage_repository: "routing.voyage_repository"
        ]

        def find_all
          voyage_repository.find_all
        end
      end
    end
  end
end
