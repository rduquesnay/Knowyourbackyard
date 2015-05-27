class AddUserToTrailupdates < ActiveRecord::Migration
  def change
    add_reference :trailupdates, :user, index: true
    remove_column :trailupdates, :postedby, :integer
  end
end
