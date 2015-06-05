class CreateResolvedreviewdisputes < ActiveRecord::Migration
  def change
    create_table :resolvedreviewdisputes do |t|
      t.references :trail, index: true
      t.integer :review_id
      t.text :name_review
      t.text :location_review
      t.text :rating_difficulty_review
      t.text :rating_duration_review
      t.text :season_review
      t.text :trailtype_review
      t.text :length_review
      t.text :gps_review
      t.text :traildirections_review
      t.text :finalcomments
      t.integer :review_user_id
      t.text :dispute_comment
      t.string :dispute_action
      t.text :comment

      t.timestamps
    end
  end
end
