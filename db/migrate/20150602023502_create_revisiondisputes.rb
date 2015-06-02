class CreateRevisiondisputes < ActiveRecord::Migration
  def change
    create_table :revisiondisputes do |t|
      t.text :comment
      t.references :revisionreview, index: true

      t.timestamps
    end
  end
end
