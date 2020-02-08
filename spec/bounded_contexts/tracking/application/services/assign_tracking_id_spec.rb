require "rails_helper"

module Tracking
  module Application
    module Services
      describe AssignTrackingId, type: :model do
        let(:service) { AssignTrackingId.new }
        let(:assign_tracking_id_command) {
          Domain::Commands::AssignTrackingNumber.new(booking_id: booking_id, tracking_number: nil)
        }
        let(:booking_id) { "booking_id" }
        let(:repo) { Infrastructure::Repositories::TrackingRepository.new }

        describe "#assign_tracking_number_to_cargo" do
          let(:assign_tracking_number_to_cargo) {
            service.assign_tracking_number_to_cargo(assign_tracking_id_command)
          }

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

        describe "#add_tracking_event" do
          let(:tracking_activity) do
            tracking_number = service.assign_tracking_number_to_cargo(assign_tracking_id_command)
            repo.find_by_tracking_number(tracking_number.value)
          end
          let(:add_tracking_event_command) do
            Domain::Commands::AddTrackingEvent.new(
              booking_id: tracking_activity.booking_id.value,
              event_time: Time.now.to_datetime,
              event_type: "TrackingActivityEventType",
              location: "ATH",
              voyage_number: "Voyage_number_from_tracking_event"
            )
          end

          it "adds a tracking event" do
            service.add_tracking_event(add_tracking_event_command)

            activity = repo.find_by_booking_id(booking_id)
            expect(activity.tracking_activity_events.size).to eq 1
            event = activity.tracking_activity_events[0]
            expect(event.tracking_voyage_number.value).to eq add_tracking_event_command.voyage_number
            expect(event.tracking_location.un_loc_code).to eq add_tracking_event_command.location
            expect(event.event_type).to eq add_tracking_event_command.event_type
            expect(event.event_time).to be_present
          end
        end
      end
    end
  end
end
