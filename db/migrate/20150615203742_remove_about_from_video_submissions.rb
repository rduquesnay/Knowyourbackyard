class RemoveAboutFromVideoSubmissions < ActiveRecord::Migration
  def change
    remove_column :video_submissions, :about, :text
  end
end
