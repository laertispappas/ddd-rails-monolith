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

        it "processes the event when dispatched" do
          expect(handler).to receive(:call).with(event)
          EventDispatcher.emit(event)
        end
      end
    end
  end
end
