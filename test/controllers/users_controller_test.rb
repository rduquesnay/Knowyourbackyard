require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @admin = users(:admin)
  end
  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
  end

  test "should get show" do
    sign_in(@user)
  #  get :show
  #  assert_response :success
  end

end
