class CreateCarrierMovement < ActiveRecord::Migration[5.2]
  def change
    create_table :carrier_movements do |t|
      t.string :arrival_location_id
      t.string :departure_location_id
      t.string :departure_location_id
      t.date :arrival_date
      t.date :departure_date

      t.references :voyage
    end
  end
end
