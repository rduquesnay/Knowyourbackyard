require 'test_helper'

class TrailTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:trailupdates)
  should have_many(:ratings)
  should have_many(:comments)
  should have_many(:reviews)
  should have_many(:revisions)
  should have_one(:video)
  should have_many(:video_submissions)

  should accept_nested_attributes_for(:ratings).allow_destroy(true)
  
end
