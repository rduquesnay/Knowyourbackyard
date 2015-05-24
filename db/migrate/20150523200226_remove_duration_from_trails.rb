class RemoveDurationFromTrails < ActiveRecord::Migration
  def change
    remove_column :trails, :durationinsec, :integer
  end
end
