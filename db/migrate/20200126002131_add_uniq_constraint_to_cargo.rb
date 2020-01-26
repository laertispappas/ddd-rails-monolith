class AddUniqConstraintToCargo < ActiveRecord::Migration[5.2]
  def change
    add_index :cargos, :booking_id, unique: :true
  end
end
