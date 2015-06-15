class CreateVideomakerSubmissions < ActiveRecord::Migration
  def change
    create_table :videomaker_submissions do |t|
      t.references :user, index: true
      t.string :demo_link
      t.text :about

      t.timestamps
    end
  end
end
