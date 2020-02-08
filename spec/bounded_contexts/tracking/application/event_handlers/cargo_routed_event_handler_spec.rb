require "rails_helper"

module Tracking
  module Application
    module EventHandlers
      describe CargoRoutedEventHandler, type: :model do
        let(:handler) { described_class }
        let(:event) {
          SharedDomain::Events::CargoRoutedEvent.new(booking_id: "booking_id")
        }

        it "processes the event when dispatched" do
          expect(handler).to receive(:call).with(event)
          EventDispatcher.emit(event)
        end
      end
    end
  end
end
