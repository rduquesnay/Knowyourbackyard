class ChangeTrailColunmNames < ActiveRecord::Migration
  def change
    remove_column :trails, :type, :string
    add_column :trails, :trailtype, :string
  end
end
