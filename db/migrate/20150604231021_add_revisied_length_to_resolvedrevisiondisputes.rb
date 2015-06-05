class AddRevisiedLengthToResolvedrevisiondisputes < ActiveRecord::Migration
  def change
    add_column :resolvedrevisiondisputes, :revisied_length, :text
  end
end
