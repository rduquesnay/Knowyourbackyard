class CreateRevisiondiputes < ActiveRecord::Migration
  def change
    create_table :revisiondiputes do |t|
      t.text :comment
      t.references :revisionreview, index: true

      t.timestamps
    end
  end
end
