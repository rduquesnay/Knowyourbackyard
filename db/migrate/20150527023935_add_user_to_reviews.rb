class AddUserToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :user, index: true
    remove_column :reviews, :posted_by, :integer
  end
end
