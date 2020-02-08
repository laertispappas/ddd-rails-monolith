class CreateTableLegs < ActiveRecord::Migration[5.2]
  def change
    create_table :legs do |t|
      t.datetime :load_time
      t.datetime :unload_time
      t.string :load_location_id
      t.string :unload_location_id
      t.string :voyage_number
      t.references :cargo
    end
  end
end
