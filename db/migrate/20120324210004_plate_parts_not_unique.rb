class PlatePartsNotUnique < ActiveRecord::Migration
  def up
    remove_index :plate_parts, :column => [:plate_id, :part_id]
    add_index :plate_parts, [:plate_id, :part_id], unique: false
  end

  def down
    remove_index :plate_parts, :column => [:plate_id, :part_id]
    add_index :plate_parts, [:plate_id, :part_id], unique: true
  end
end
