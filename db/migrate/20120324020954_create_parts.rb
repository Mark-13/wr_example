class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :content
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end
end
