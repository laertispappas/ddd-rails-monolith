require "rails_helper"

module Tracking
  module Application
    module EventHandlers
      describe CargoBookedEventHandler, type: :model do
        let(:handler) { described_class }
        let(:event) {
          SharedDomain::Events::CargoBookedEvent.new(id: "test")
        }

        it "processes the event when dispatched" do
          expect(handler).to receive(:call).with(event)
          EventDispatcher.emit(event)
        end
      end
    end
  end
end
