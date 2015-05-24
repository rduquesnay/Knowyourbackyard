class AddLengthToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :length, :float
  end
end
