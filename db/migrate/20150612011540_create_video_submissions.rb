class CreateVideoSubmissions < ActiveRecord::Migration
  def change
    create_table :video_submissions do |t|
      t.references :trail, index: true
      t.string :demo_link
      t.text :about

      t.timestamps
    end
  end
end
