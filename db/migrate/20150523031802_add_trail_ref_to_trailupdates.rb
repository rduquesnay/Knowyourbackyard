class AddTrailRefToTrailupdates < ActiveRecord::Migration
  def change
    add_reference :trailupdates, :trail, index: true
  end
end
