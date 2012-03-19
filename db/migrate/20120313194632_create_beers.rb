class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
    add_index :beers, :slug, unique: true, order: {:slug => :asc}
  end
end
