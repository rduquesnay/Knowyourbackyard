class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url, default: ""
      t.references :trail, index: true
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
