class CreateResolvedrevisiondisputes < ActiveRecord::Migration
  def change
    create_table :resolvedrevisiondisputes do |t|
      t.references :trail, index: true
      t.integer :revision_id
      t.string :revisied_name
      t.string :revisied_location
      t.string :revisied_season
      t.string :revisied_trailtype
      t.float :revisied_latitude
      t.float :revisied_longitude
      t.text :revisied_traildirections
      t.integer :review_id
      t.text :name_review
      t.text :location_review
      t.text :length_review
      t.text :season_review
      t.text :trailtype_review
      t.text :gps_review
      t.text :traildirections_review
      t.text :finalcomments
      t.string :review_user_id
      t.text :dispute_comment
      t.string :dispute_action
      t.text :comment

      t.timestamps
    end
  end
end
