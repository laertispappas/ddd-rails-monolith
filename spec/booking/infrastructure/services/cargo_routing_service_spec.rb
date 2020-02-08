require "rails_helper"

module Booking
  module Infrastructure
    module Services
      # TODO: Proper fake mock implementation
      # This is just to show a demonstration a proper
      # fake http client implementation mini frame work should be implemented
      # or use external libs instead. for the brevity of sake we use this for now
      # Will come to this later.
      #
      module FakeHttpClientMock
        module_function

        def get(_path, _params)
          {
            edges: [
              {
                voyage_number: "voyage_number",
                from_un_locode: "fromun",
                to_un_locode: "toun",
                from_date: Time.now.iso8601,
                to_date: 1.week.from_now.iso8601
              }
            ]
          }
        end
      end

      RSpec.describe ExternalCargoRoutingServiceClient, type: :model do
        # dependency injection is provided by dry-container. Quite neat.
        #
        let(:service) { described_class.new }

        # Change http client to use a mock http client service instead.
        # We do it per spec here otherwise we can change the provided
        # services for all test environment so we can have mocked clients for
        # our unit tests and actual implementation for out integration tests.
        #
        before do
          Booking::AppContainer.enable_stubs!
          Booking::AppContainer.stub("shared.http_client", FakeHttpClientMock)
        end

        after do
          Booking::AppContainer.unstub("shared.http_client")
        end

        it "creates a transit path" do
          res = service.find_optimal_route(
            origin: "ATH", destination: "HAM", arrival_deadline: 1.week.from_now.iso8601
          )
          expect(res).to be_a SharedDomain::Model::TransitPath
          expect(res.edges.size).to eq 2
        end
      end
    end
  end
end
