class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
    add_index :drinks, :slug, unique: true, order: {:slug => :asc}
  end
end
