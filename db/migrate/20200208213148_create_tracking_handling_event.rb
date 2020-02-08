class CreateTrackingHandlingEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :tracking_handling_events do |t|
      t.string :event_type
      t.datetime :event_time
      t.string :location_id
      t.string :voyage_number
      t.references :tracking_activity
    end
  end
end
