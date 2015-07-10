require 'test_helper'

class TrailupdatesControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @admin = users(:admin)
    @update = trailupdates(:one)
  end

  test "should get new" do
    sign_in(@user)
    get :new
    assert_response :success
  end

  test "should get create" do
    sign_in(@user)
    assert_difference('Trailupdate.count') do
      post :create, trailupdate: { message: @update.message, trail_id: 1}
    end
    assert_redirected_to trail_path(1)
  end

  test "should destory trailupdate" do
    sign_in(@admin)
    assert_difference('Trailupdate.count', -1) do
      delete :destroy, id: @update
    end
    assert_redirected_to trail_path(1)
  end

end
