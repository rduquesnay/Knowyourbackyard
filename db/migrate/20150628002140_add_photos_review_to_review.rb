class AddPhotosReviewToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :photos_review, :text
  end
end
