class AddUserToRevisions < ActiveRecord::Migration
  def change
    add_reference :revisions, :user, index: true
    remove_column :revisions, :posted_by, :integer
  end
end
