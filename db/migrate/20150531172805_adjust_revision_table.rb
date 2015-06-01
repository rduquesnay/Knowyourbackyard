class AdjustRevisionTable < ActiveRecord::Migration
  def change
    remove_column :revisions, :name_review, :text
    add_column :revisions, :name, :string
    remove_column :revisions, :location_review, :text
    add_column :revisions, :location, :string
    remove_column :revisions, :season_review, :text
    add_column :revisions, :season, :string
    remove_column :revisions, :trailtype_review, :text
    add_column :revisions, :trailtype, :string
    remove_column :revisions, :gps_review, :text
    add_column :revisions, :latitude, :float
    add_column :revisions, :longitude, :float
    remove_column :revisions, :traildirections_review, :text
    add_column :revisions, :traildirections, :text
    add_column :revisions, :length, :float
  end
end
