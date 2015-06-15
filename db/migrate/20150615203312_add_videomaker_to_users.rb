class AddVideomakerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :videomaker, :boolean, default: false
  end
end
