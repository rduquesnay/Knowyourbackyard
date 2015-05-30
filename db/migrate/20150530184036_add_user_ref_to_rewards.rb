class AddUserRefToRewards < ActiveRecord::Migration
  def change
    add_reference :rewards, :user, index: true
  end
end
