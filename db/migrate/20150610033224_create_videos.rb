class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :src
      t.references :trail, index: true

      t.timestamps
    end
  end
end
