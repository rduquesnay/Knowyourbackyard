class AddOriginalTrailblazerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :original_trailblazer, :boolean, default: false
  end
end
