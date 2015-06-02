class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :companyname
      t.text :about
      t.string :link

      t.timestamps
    end
  end
end
