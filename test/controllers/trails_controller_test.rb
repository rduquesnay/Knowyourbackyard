require 'test_helper'

class TrailsControllerTest < ActionController::TestCase
  setup do
    @trail = trails(:one)
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:trails)
  end

  test "should get new" do
    sign_in(@user)
    get :new
    assert_response :success
  end

  test "should create trail" do
    sign_in(@user)
    assert_difference('Trail.count') do
      post :create, trail: { latitude: 12, location: "testloc", longitude: 23, name: "testname", season: "Winter", traildirections: "text", trailtype: "Hikking", length: 12.4, user_id: @user.id, ratings_attributes: {:"0" => {difficulty: 3, durationinsec: 12, favourite: true}} }
    end

    assert_redirected_to trail_path(assigns(:trail))
  end

  test "should show trail" do
    get :show, id: @trail
    assert_response 302
  end

  test "should get edit" do
    sign_in(@user)
  #  get :edit, id: @trail
  #  assert_response :success
  end

  test "should update trail" do
    sign_in(@user)
  #  patch :update, id: @trail, trail: { latitude: 12, location: "testloc", longitude: 23, name: "testname", season: "Winter", traildirections: "text", trailtype: "Hikking", length: 12.4, user_id: @user.id, ratings_attributes: {:"0" => {difficulty: 3, durationinsec: 12, favourite: true}} }
  #  assert_redirected_to trail_path(assigns(:trail))
  end

  test "should destroy trail" do
    sign_in(@admin)
    assert_difference('Trail.count', -1) do
      delete :destroy, id: @trail
    end

    assert_redirected_to trails_path
  end
end
