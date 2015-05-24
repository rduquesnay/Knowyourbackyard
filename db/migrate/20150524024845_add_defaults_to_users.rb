class AddDefaultsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :admin, :boolean, default: false

    remove_column :users, :trailblazer, :boolean
    add_column :users, :trailblazer, :boolean, default: false
    
    remove_column :users, :points, :integer
    add_column :users, :points, :integer, default: 0
  end
end
