require "rails_helper"

module Tracking
  module Application
    module Services
      describe AssignTrackingId, type: :model do
        let(:service) { AssignTrackingId.new }
        let(:command) {
          Domain::Commands::AssignTrackingNumber.new(booking_id: booking_id, tracking_number: tracking_number)
        }
        let(:booking_id) { "booking_id" }
        let(:tracking_number) { "tracking_number" }

        describe "#assign_tracking_number_to_cargo" do
          let(:assign_tracking_number_to_cargo) { service.assign_tracking_number_to_cargo(command) }

          it "runs" do
            assign_tracking_number_to_cargo
          end
        end
      end
    end
  end
end
