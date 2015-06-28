class AddPhotosReviewToRevisionreview < ActiveRecord::Migration
  def change
    add_column :revisionreviews, :photos_review, :text
  end
end
