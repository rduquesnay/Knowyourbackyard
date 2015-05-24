class RemoveDifficultyFromTrails < ActiveRecord::Migration
  def change
    remove_column :trails, :difficulty, :integer
  end
end
