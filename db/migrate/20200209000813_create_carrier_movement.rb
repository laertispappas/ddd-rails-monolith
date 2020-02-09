class CreateCarrierMovement < ActiveRecord::Migration[5.2]
  def change
    create_table :carrier_movements do |t|
      t.string :arrival_location_id, null: false
      t.string :departure_location_id, null: false
      t.datetime :arrival_date, null: false
      t.datetime :departure_date, null: false

      t.references :voyage, null: false
    end
  end
end
