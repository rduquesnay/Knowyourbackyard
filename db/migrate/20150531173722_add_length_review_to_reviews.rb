class AddLengthReviewToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :length_review, :text
  end
end
