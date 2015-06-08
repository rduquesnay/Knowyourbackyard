class AddDefaultToViewbyguestInTrails < ActiveRecord::Migration
  def change
    remove_column :trails, :viewbyguest, :boolean
    add_column  :trails, :viewbyguest, :boolean, default: false
  end
end
