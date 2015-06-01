class Contact < ActiveRecord::Base
 validates :subject,:message, presence: true 

end
