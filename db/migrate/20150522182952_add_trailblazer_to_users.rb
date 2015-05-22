class AddTrailblazerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trailblazer, :boolean
  end
end
