class AddLengthReviewToRevisionreview < ActiveRecord::Migration
  def change
    add_column :revisionreviews, :length_review, :text
  end
end
