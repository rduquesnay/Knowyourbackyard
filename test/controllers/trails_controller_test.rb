require 'test_helper'

class TrailsControllerTest < ActionController::TestCase
  setup do
    @trail = trails(:one)
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in(@admin)
  #  get :index
  #  assert_response :success
  #  assert_not_nil assigns(:trails)
  end

  test "should get new" do
    sign_in(@user)
    get :new
    assert_response :success
  end

  test "should create trail" do
    sign_in(@user)
  #  assert_difference('Trail.count') do
  #    post :create, trail: { avgdifficulty: @trail.avgdifficulty, avgduration: @trail.avgduration, latitude: @trail.latitude, location: @trail.location, longitude: @trail.longitude, name: @trail.name, season: @trail.season, traildirections: @trail.traildirections, trailtype: @trail.trailtype, length: @trail.length }
  #  end

  #  assert_redirected_to trail_path(assigns(:trail))
  end

  test "should show trail" do
  #  get :show, id: @trail
  #  assert_response :success
  end

  test "should get edit" do
    sign_in(@user)
  #  get :edit, id: @trail
  #  assert_response :success
  end

  test "should update trail" do
    sign_in(@user)
  #  patch :update, id: @trail, trail: { avgdifficulty: @trail.avgdifficulty, avgduration: @trail.avgduration, latitude: @trail.latitude, location: @trail.location, longitude: @trail.longitude, name: @trail.name, season: @trail.season, traildirections: @trail.traildirections, trailtype: @trail.trailtype, length: @trail.length }
  #  assert_redirected_to trail_path(assigns(:trail))
  end

  test "should destroy trail" do
    sign_in(@admin)
  #  assert_difference('Trail.count', -1) do
  #    delete :destroy, id: @trail
  #  end

  #  assert_redirected_to trails_path
  end
end
