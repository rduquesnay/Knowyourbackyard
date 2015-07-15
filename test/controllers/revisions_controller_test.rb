require 'test_helper'

class RevisionsControllerTest < ActionController::TestCase
  setup do
    @revision = revisions(:one)
    @user = users(:one)
    @admin = users(:admin)
    @tb = users(:tb)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:revisions)
  end

  test "should get new" do
    sign_in(@user)
    get :new, trail_id: 1
    assert_response :success
  end

  test "should create revision" do
    sign_in(@user)
    assert_difference('Revision.count') do
      post :create, revision: { length: @revision.length, latitude: @revision.latitude, longitude: @revision.longitude, location: @revision.location, name: @revision.name, user_id: @revision.user_id, season: @revision.season, trail_id: @revision.trail_id, traildirections: @revision.traildirections, trailtype: @revision.trailtype }
    end

    assert_redirected_to trail_path(1)
  end

  test "should show revision" do
    sign_in(@tb)
    get :show, id: @revision
    assert_response :success
  end

  test "should get edit" do
    sign_in(@user)
    get :edit, id: @revision
    assert_response :success
  end

  test "should update revision" do
    sign_in(@user)
    patch :update, id: @revision, revision: { length: @revision.length, latitude: @revision.latitude, longitude: @revision.longitude, location: @revision.location, name: @revision.name, user_id: @revision.user_id, season: @revision.season, trail_id: @revision.trail_id, traildirections: @revision.traildirections, trailtype: @revision.trailtype }
    assert_redirected_to revision_path(assigns(:revision))
  end

  test "should destroy revision" do
    sign_in(@user)
    assert_difference('Revision.count', -1) do
      delete :destroy, id: @revision
    end

    assert_redirected_to revisions_path
  end
end
