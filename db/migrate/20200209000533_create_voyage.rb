class CreateVoyage < ActiveRecord::Migration[5.2]
  def change
    create_table :voyages do |t|
      t.string :voyage_number
    end
  end
end
