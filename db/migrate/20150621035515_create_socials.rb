class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :facebook_link
      t.string :linkedin_link
      t.string :youtube_link
      t.string :instagram_link
      t.references :user, index: true

      t.timestamps
    end
  end
end
