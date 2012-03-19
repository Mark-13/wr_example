class CreateDrinkImages < ActiveRecord::Migration
  def change
    create_table :drink_images do |t|
      t.string :credits
      t.datetime :upload_date
      t.string :picture
      t.integer :drink_id
      t.timestamps
    end
  end
end
