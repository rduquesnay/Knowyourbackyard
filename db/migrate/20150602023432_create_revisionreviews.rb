class CreateRevisionreviews < ActiveRecord::Migration
  def change
    create_table :revisionreviews do |t|
      t.text :name_review
      t.text :location_review
      t.text :season_review
      t.text :trailtype_review
      t.text :gps_review
      t.string :traildirection_review
      t.text :finalcomments
      t.references :user, index: true
      t.references :revision, index: true

      t.timestamps
    end
  end
end
