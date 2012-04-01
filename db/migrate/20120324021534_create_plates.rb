class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.string :name
      t.datetime :datetime
      t.integer :parent_id
      t.integer :precision
      t.string :tags

      t.timestamps
    end
  end
end
