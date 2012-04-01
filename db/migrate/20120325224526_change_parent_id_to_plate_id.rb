class ChangeParentIdToPlateId < ActiveRecord::Migration
  def up
   remove_column :plates, :parent_id
   add_column :plates, :plate_id, :integer
  end

  def down
   remove_column :plates, :plate_id
   add_column :plates, :parent_id, :integer
  end
end
