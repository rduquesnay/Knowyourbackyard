class AddTrailRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :trail, index: true
  end
end
