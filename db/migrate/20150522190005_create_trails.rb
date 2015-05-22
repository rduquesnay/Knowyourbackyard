class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.string :location
      t.integer :difficulty
      t.integer :durationinsec
      t.string :season
      t.string :type
      t.float :latitude
      t.float :longitude
      t.text :traildirections

      t.timestamps
    end
  end
end
