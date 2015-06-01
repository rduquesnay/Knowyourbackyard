class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :subject
      t.text :message
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :from_id

      t.timestamps
    end
  end
end
