require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:trails)
  should have_many(:comments)
  should have_many(:trailupdates)
  should have_many(:reviews)
  should have_many(:revisions)
  should have_many(:notifications)
  should have_one(:social)
 
  #devise
  should validate_presence_of(:email)
  should validate_presence_of(:username)
  should validate_presence_of(:password)
  should validate_presence_of(:firstname)
  should validate_presence_of(:lastname)
  should validate_presence_of(:country)

  should validate_uniqueness_of(:email)
  should validate_uniqueness_of(:username).case_insensitive
  
end
