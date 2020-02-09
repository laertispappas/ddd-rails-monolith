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
        let(:payload) do
          JSON.parse(response.body)
        end

        it "responds with 200" do
          do_request

          expect(response.status).to eq 200
        end

        context "when no edges are found" do
          it "returns the correct payload" do
            do_request

            expect(payload).to eq({ "edges" => [] })
          end
        end

        context "when a routing voyage exists" do
          let(:voyage) do
            Domain::Aggregates::Voyage.new(
              schedule: schedule,
              voyage_number: voyage_number
            )
          end

          let(:schedule) do
            Domain::ValueObjects::Schedule.new(
              carrier_movements: []
            )
          end

          let(:voyage_number) do
            Domain::ValueObjects::VoyageNumber.new(value: "voyage-number")
          end

          before do
            Infrastructure::Repositories::VoyageRepository.new.store(voyage).tap(&:commit!)
          end

          it "returns the correct http status and response" do
            do_request
            expect(response.status).to eq 200
            expect(payload).to eq({ "edges" => [] })
          end

          context "when a schedule exists" do
            let(:schedule) do
              Domain::ValueObjects::Schedule.new(
                carrier_movements: [carrier_movement]
              )
            end
            let(:carrier_movement) do
              Domain::Entities::CarrierMovement.new(
                arrival_date: arrival_date,
                departure_date: departure_date,
                arrival_location: Domain::ValueObjects::Location.new(un_loc_code: arrival_loc),
                departure_location: Domain::ValueObjects::Location.new(un_loc_code: departure_loc)
              )
            end
            let(:arrival_date) { Time.zone.now.to_datetime }
            let(:departure_date) { 2.days.from_now.to_datetime }
            let(:arrival_loc) { "ATH" }
            let(:departure_loc) { "LIS" }

            it "returns the correct response code and payload" do
              do_request

              expect(response.status).to eq 200
              expected_payload = {
                edges: [
                  {
                    voyage_number:  voyage_number.value,
                    from_un_locode: arrival_loc,
                    to_un_locode: departure_loc,
                    from_date: arrival_date,
                    to_date: departure_date
                  }
                ]
              }
              expect(payload["edges"].size).to eq 1
              expect(payload["edges"][0]["voyage_number"]).to eq voyage_number.value
              expect(payload["edges"][0]["from_date"]).to be_present
              expect(payload["edges"][0]["to_date"]).to be_present
            end
          end
        end
      end
    end
  end
end
