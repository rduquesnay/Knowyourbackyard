class AddViewbyguestToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :viewbyguest, :boolean
  end
end
