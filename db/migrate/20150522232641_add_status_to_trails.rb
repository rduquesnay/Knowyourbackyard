class AddStatusToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :status, :string
  end
end
