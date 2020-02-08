class CreateTrackingActivity < ActiveRecord::Migration[5.2]
  def change
    create_table :tracking_activities do |t|
      t.string :tracking_number, null: false
      t.string :booking_id, null: false
    end
  end
end
