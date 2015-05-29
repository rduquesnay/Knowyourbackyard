class Notification < ActiveRecord::Base
  belongs_to :user
  validates :message, :link, presence: true 

end
