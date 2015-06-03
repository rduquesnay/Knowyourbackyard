require 'test_helper'

class RevisionreviewsControllerTest < ActionController::TestCase
  setup do
    @revisionreview = revisionreviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:revisionreviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create revisionreview" do
    assert_difference('Revisionreview.count') do
      post :create, revisionreview: { finalcomments: @revisionreview.finalcomments, gps_review: @revisionreview.gps_review, location_review: @revisionreview.location_review, name_review: @revisionreview.name_review, revision_id: @revisionreview.revision_id, season_review: @revisionreview.season_review, traildirection_review: @revisionreview.traildirection_review, trailtype_review: @revisionreview.trailtype_review, user_id: @revisionreview.user_id }
    end

    assert_redirected_to revisionreview_path(assigns(:revisionreview))
  end

  test "should show revisionreview" do
    get :show, id: @revisionreview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @revisionreview
    assert_response :success
  end

  test "should update revisionreview" do
    patch :update, id: @revisionreview, revisionreview: { finalcomments: @revisionreview.finalcomments, gps_review: @revisionreview.gps_review, location_review: @revisionreview.location_review, name_review: @revisionreview.name_review, revision_id: @revisionreview.revision_id, season_review: @revisionreview.season_review, traildirection_review: @revisionreview.traildirection_review, trailtype_review: @revisionreview.trailtype_review, user_id: @revisionreview.user_id }
    assert_redirected_to revisionreview_path(assigns(:revisionreview))
  end

  test "should destroy revisionreview" do
    assert_difference('Revisionreview.count', -1) do
      delete :destroy, id: @revisionreview
    end

    assert_redirected_to revisionreviews_path
  end
end