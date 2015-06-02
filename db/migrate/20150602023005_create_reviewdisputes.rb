class CreateReviewdisputes < ActiveRecord::Migration
  def change
    create_table :reviewdisputes do |t|
      t.text :comment
      t.references :review, index: true

      t.timestamps
    end
  end
end
