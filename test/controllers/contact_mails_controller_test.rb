require 'test_helper'

class ContactMailsControllerTest < ActionController::TestCase
  setup do
    @admin = users(:admin)
  end

  test "should get new" do
    sign_in(@admin)
  #  get :new
  #  assert_response :success
  end

  test "should create mail" do
    sign_in(@admin)

  #  assert_redirected_to contacts_path
  end

end
