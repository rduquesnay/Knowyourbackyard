class CreateTrailupdates < ActiveRecord::Migration
  def change
    create_table :trailupdates do |t|
      t.text :message

      t.timestamps
    end
  end
end
