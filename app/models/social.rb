class Social < ActiveRecord::Base
  belongs_to :user
  validates :facebook_link, format: { with: /facebook.com\//}
  validates :linkedin_link, format: { with: /linkedin.com\//}
  validates :youtube_link, format: { with: /youtube.com\//}
  validates :instagram_link, format: { with: /instagram.com\//}
end
