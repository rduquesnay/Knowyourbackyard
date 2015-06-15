class AddDemotedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :demoted, :boolean, default: false
  end
end
