class AddAvgdurationToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :avgduration, :integer
  end
end
