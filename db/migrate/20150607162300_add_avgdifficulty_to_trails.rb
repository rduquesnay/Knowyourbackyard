class AddAvgdifficultyToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :avgdifficulty, :integer
  end
end
