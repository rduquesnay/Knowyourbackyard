class AddPhotosToResolvedrevisiondispute < ActiveRecord::Migration
  def change
    add_column :resolvedrevisiondisputes, :photos_review, :text
    add_column :resolvedrevisiondisputes, :revisied_photos, :string
  end
end
