require "rails_helper"

module Routing
  module Application
    module Controllers
      describe CargoRoutingController, type: :request do
        let(:do_request) { get(path, params: params) }
        let(:path) { "/optimal_route" }
        let(:params) do
          {
            origin: "origin",
            destination: "destination",
            deadline: "deadline"
          }
        end

        it "test" do
          do_request
        end
      end
    end
  end
end
