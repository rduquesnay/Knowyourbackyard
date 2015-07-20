class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.string :url, default: ""
      t.references :sponsor, index: true
      t.timestamps
    end
  end
end
