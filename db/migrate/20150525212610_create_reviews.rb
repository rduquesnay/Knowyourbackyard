class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :name_review
      t.text :location_review
      t.text :rating_difficulty_review
      t.text :rating_duration_review
      t.text :season_review
      t.text :trailtype_review
      t.text :gps_review
      t.text :traildirections_review
      t.text :finalcomments
      t.references :trail, index: true
      t.integer :posted_by

      t.timestamps
    end
  end
end
