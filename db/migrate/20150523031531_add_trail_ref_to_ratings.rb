class AddTrailRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :trail, index: true
  end
end
