class AddUserToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    remove_column :comments, :postedby, :integer
  end
end
