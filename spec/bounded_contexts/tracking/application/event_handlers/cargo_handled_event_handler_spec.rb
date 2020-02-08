require "rails_helper"

module Tracking
  module Application
    module EventHandlers
      describe CargoHandledEventHandler, type: :model do
        let(:handler) { described_class }
        let(:event) {
          SharedDomain::Events::CargoHandledEvent.new(
            booking_id: "booking_id",
            handling_type: "handling_type",
            handling_completion_time: Time.now.to_datetime,
            handling_location: "handling_location",
            voyage_number: "voyage_number"
          )
        }

        module AssignServiceMock
          def self.add_tracking_event(command)
            command
          end
        end

        before do
          Tracking::Container.enable_stubs!
          Tracking::Container.stub("tracking.assign_tracking_id_service", AssignServiceMock)
        end

        after do
          Tracking::Container.unstub("shared.http_client")
        end

        it "processes the event when dispatched" do
          expect(handler).to receive(:call).with(event)
          EventDispatcher.emit(event)
        end

        it "adds a tracking event" do
          expect(AssignServiceMock).to receive(:add_tracking_event).with(
            CargoHandledEventHandler::TrackingActivityEventAssembler.to_command_from_event(event)
          )
          EventDispatcher.emit(event)
        end
      end
    end
  end
end
