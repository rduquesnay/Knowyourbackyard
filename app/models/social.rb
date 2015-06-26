class Social < ActiveRecord::Base
  belongs_to :user
  validates_format_of :facebook_link, with: /facebook.com\// on: :create
  validates_format_of :linkedin_link, with: /linkedin.com\// on: :create
  validates_format_of :youtube_link, with: /youtube.com\// on: :create
  validates_format_of :instagram_link, with: /instagram.com\// on: :create
end
