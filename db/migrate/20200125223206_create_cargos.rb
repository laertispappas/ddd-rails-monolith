class CreateCargos < ActiveRecord::Migration[5.2]
  def change
    create_table :cargos do |t|
      t.string :booking_id, null: false
      t.integer :booking_amount, null: false

      t.string :transport_status, null: false
      t.string :routing_status, null: false

      # Route specification
      t.string :spec_origin_id
      t.string :spec_destination_id
      t.datetime :spec_arrival_deadline

      t.string :origin_id

      t.integer :handling_event_id
      t.string :next_expected_location_id
      t.string :next_expected_handling_event_type
      t.string :next_expected_voyage_id
      t.string :last_known_location_id
      t.string :current_voyage_number
      t.integer :last_handling_event_id
      t.string :last_handling_event_type
      t.string :last_handling_event_location
      t.string :last_handling_event_voyage
    end
  end
end
