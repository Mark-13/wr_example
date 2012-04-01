class CreatePlateParts < ActiveRecord::Migration
  def change
    create_table :plate_parts do |t|
      t.string :name
      t.integer :plate_id
      t.integer :part_id

      t.timestamps
    end

    add_index :plate_parts, :plate_id
    add_index :plate_parts, :part_id
    add_index :plate_parts, [:plate_id, :part_id], unique: true

  end
end
