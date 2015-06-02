class CreateReviewdiputes < ActiveRecord::Migration
  def change
    create_table :reviewdiputes do |t|
      t.text :comment
      t.references :review, index: true

      t.timestamps
    end
  end
end
