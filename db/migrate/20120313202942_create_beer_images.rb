class CreateBeerImages < ActiveRecord::Migration
  def change
    create_table :beer_images do |t|
      t.string :credits
      t.datetime :upload_date
      t.string :picture
      t.integer :beer_id	
      t.timestamps
    end
  end
end
