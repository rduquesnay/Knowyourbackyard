class AddIdsToChats < ActiveRecord::Migration
  def change
    add_column :chats, :contact_id, :integer
    add_column :chats, :admin_id, :integer
  end
end
