class AddPhotosReviewToResolvedreviewdispute < ActiveRecord::Migration
  def change
    add_column :resolvedreviewdisputes, :photos_review, :text
  end
end
