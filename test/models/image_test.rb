require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  should belong_to(:trail)
end
