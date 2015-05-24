class AddPostedbyToTrailupdates < ActiveRecord::Migration
  def change
    add_column :trailupdates, :postedby, :integer
  end
end
