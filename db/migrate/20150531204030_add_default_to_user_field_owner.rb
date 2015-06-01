class AddDefaultToUserFieldOwner < ActiveRecord::Migration
  def change
    remove_column :users, :owner, :boolean
    add_column :users, :owner, :boolean, default: false
  end
end
