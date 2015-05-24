class AddDefaultsToTables < ActiveRecord::Migration
  def change
    remove_column :ratings, :favourite, :boolean
    add_column :ratings, :favourite, :boolean, default: false
    
    remove_column :ratings, :difficulty, :integer
    add_column :ratings, :difficulty, :integer, default: 0
    
    remove_column :ratings, :durationinsec, :integer
    add_column :ratings, :durationinsec, :integer, default: 0
    
    remove_column :trails, :status, :string
    add_column :trails, :status, :string, default: 'To be reviewed'

    remove_column :trails, :length, :float
    add_column :trails, :length, :float, default: 0.0
  end
end
