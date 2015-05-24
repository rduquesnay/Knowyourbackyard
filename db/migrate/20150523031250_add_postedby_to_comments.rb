class AddPostedbyToComments < ActiveRecord::Migration
  def change
    add_column :comments, :postedby, :integer
  end
end
