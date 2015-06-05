require 'test_helper'

class ResolvedrevisiondisputesControllerTest < ActionController::TestCase
  setup do
    @resolvedrevisiondispute = resolvedrevisiondisputes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resolvedrevisiondisputes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resolvedrevisiondispute" do
    assert_difference('Resolvedrevisiondispute.count') do
      post :create, resolvedrevisiondispute: { comment: @resolvedrevisiondispute.comment, dispute_action: @resolvedrevisiondispute.dispute_action, dispute_comment: @resolvedrevisiondispute.dispute_comment, finalcomments: @resolvedrevisiondispute.finalcomments, gps_review: @resolvedrevisiondispute.gps_review, length_review: @resolvedrevisiondispute.length_review, location_review: @resolvedrevisiondispute.location_review, name_review: @resolvedrevisiondispute.name_review, review_id: @resolvedrevisiondispute.review_id, review_user_id: @resolvedrevisiondispute.review_user_id, revisied_latitude: @resolvedrevisiondispute.revisied_latitude, revisied_location: @resolvedrevisiondispute.revisied_location, revisied_longitude: @resolvedrevisiondispute.revisied_longitude, revisied_name: @resolvedrevisiondispute.revisied_name, revisied_season: @resolvedrevisiondispute.revisied_season, revisied_traildirections: @resolvedrevisiondispute.revisied_traildirections, revisied_trailtype: @resolvedrevisiondispute.revisied_trailtype, revision_id: @resolvedrevisiondispute.revision_id, season_review: @resolvedrevisiondispute.season_review, trail_id: @resolvedrevisiondispute.trail_id, traildirections_review: @resolvedrevisiondispute.traildirections_review, trailtype_review: @resolvedrevisiondispute.trailtype_review }
    end

    assert_redirected_to resolvedrevisiondispute_path(assigns(:resolvedrevisiondispute))
  end

  test "should show resolvedrevisiondispute" do
    get :show, id: @resolvedrevisiondispute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resolvedrevisiondispute
    assert_response :success
  end

  test "should update resolvedrevisiondispute" do
    patch :update, id: @resolvedrevisiondispute, resolvedrevisiondispute: { comment: @resolvedrevisiondispute.comment, dispute_action: @resolvedrevisiondispute.dispute_action, dispute_comment: @resolvedrevisiondispute.dispute_comment, finalcomments: @resolvedrevisiondispute.finalcomments, gps_review: @resolvedrevisiondispute.gps_review, length_review: @resolvedrevisiondispute.length_review, location_review: @resolvedrevisiondispute.location_review, name_review: @resolvedrevisiondispute.name_review, review_id: @resolvedrevisiondispute.review_id, review_user_id: @resolvedrevisiondispute.review_user_id, revisied_latitude: @resolvedrevisiondispute.revisied_latitude, revisied_location: @resolvedrevisiondispute.revisied_location, revisied_longitude: @resolvedrevisiondispute.revisied_longitude, revisied_name: @resolvedrevisiondispute.revisied_name, revisied_season: @resolvedrevisiondispute.revisied_season, revisied_traildirections: @resolvedrevisiondispute.revisied_traildirections, revisied_trailtype: @resolvedrevisiondispute.revisied_trailtype, revision_id: @resolvedrevisiondispute.revision_id, season_review: @resolvedrevisiondispute.season_review, trail_id: @resolvedrevisiondispute.trail_id, traildirections_review: @resolvedrevisiondispute.traildirections_review, trailtype_review: @resolvedrevisiondispute.trailtype_review }
    assert_redirected_to resolvedrevisiondispute_path(assigns(:resolvedrevisiondispute))
  end

  test "should destroy resolvedrevisiondispute" do
    assert_difference('Resolvedrevisiondispute.count', -1) do
      delete :destroy, id: @resolvedrevisiondispute
    end

    assert_redirected_to resolvedrevisiondisputes_path
  end
end
