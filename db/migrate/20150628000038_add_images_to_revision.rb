class AddImagesToRevision < ActiveRecord::Migration
  def change
    add_column :revisions, :images, :string
  end
end
