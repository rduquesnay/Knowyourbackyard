class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :difficulty
      t.integer :durationinsec
      t.boolean :favourite

      t.timestamps
    end
  end
end
