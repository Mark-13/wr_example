class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.integer :plate_id
      t.text :text

      t.timestamps
    end
  end
end
