class AddUserRefToTrails < ActiveRecord::Migration
  def change
    add_reference :trails, :user, index: true
  end
end
