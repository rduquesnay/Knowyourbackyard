class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.text :name_review
      t.text :location_review
      t.text :season_review
      t.text :trailtype_review
      t.text :gps_review
      t.text :traildirections_review
      t.references :trail, index: true
      t.integer :posted_by

      t.timestamps
    end
  end
end
