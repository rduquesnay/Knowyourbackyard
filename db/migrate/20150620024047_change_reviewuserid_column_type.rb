class ChangeReviewuseridColumnType < ActiveRecord::Migration
  def change
    remove_column :resolvedrevisiondisputes, :review_user_id, :string
    add_column  :resolvedrevisiondisputes, :review_user_id, :integer
  end
end
