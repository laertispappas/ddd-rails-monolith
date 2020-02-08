require "rails_helper"

module Tracking
  module Application
    module Services
      describe AssignTrackingId, type: :model do
        let(:service) { AssignTrackingId.new }
        let(:command) {
          Domain::Commands::AssignTrackingNumber.new(booking_id: booking_id, tracking_number: nil)
        }
        let(:booking_id) { "booking_id" }
        let(:repo) { Infrastructure::Repositories::TrackingRepository.new }

        describe "#assign_tracking_number_to_cargo" do
          let(:assign_tracking_number_to_cargo) { service.assign_tracking_number_to_cargo(command) }

          it "returns a tracking numner" do
            tracking_number = assign_tracking_number_to_cargo
            expect(tracking_number).to be_a Domain::Aggregates::TrackingNumber
            expect(tracking_number.value).to be_present
          end

          it "stores a tracking activity" do
            tracking_number = assign_tracking_number_to_cargo

            tracking_activity = repo.find_by_tracking_number(tracking_number.value)
            expect(tracking_activity.tracking_number.value).to eq(tracking_number.value)
            expect(tracking_activity.booking_id.value).to eq(booking_id)
          end
        end
      end
    end
  end
end
