class RemoveViewbyquestOnTrails < ActiveRecord::Migration
  def change
    remove_column :trails, :viewbyquest, :boolean
  end
end
