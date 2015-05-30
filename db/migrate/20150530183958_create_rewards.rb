class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :points
      t.integer :trail_id
      t.integer :review_id
      t.integer :revision_id
      t.integer :update_id

      t.timestamps
    end
  end
end
