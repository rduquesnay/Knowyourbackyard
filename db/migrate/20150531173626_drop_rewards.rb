class DropRewards < ActiveRecord::Migration
  def change
    drop_table :rewards
  end
end
