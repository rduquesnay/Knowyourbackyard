require 'test_helper'

class ResolvedreviewdisputesControllerTest < ActionController::TestCase
  setup do
    @resolvedreviewdispute = resolvedreviewdisputes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resolvedreviewdisputes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resolvedreviewdispute" do
    assert_difference('Resolvedreviewdispute.count') do
      post :create, resolvedreviewdispute: { comment: @resolvedreviewdispute.comment, dispute_action: @resolvedreviewdispute.dispute_action, dispute_comment: @resolvedreviewdispute.dispute_comment, finalcomments: @resolvedreviewdispute.finalcomments, gps_review: @resolvedreviewdispute.gps_review, length_review: @resolvedreviewdispute.length_review, location_review: @resolvedreviewdispute.location_review, name_review: @resolvedreviewdispute.name_review, rating_difficulty_review: @resolvedreviewdispute.rating_difficulty_review, rating_duration_review: @resolvedreviewdispute.rating_duration_review, review_id: @resolvedreviewdispute.review_id, review_user_id: @resolvedreviewdispute.review_user_id, season_review: @resolvedreviewdispute.season_review, trail_id: @resolvedreviewdispute.trail_id, traildirections_review: @resolvedreviewdispute.traildirections_review, trailtype_review: @resolvedreviewdispute.trailtype_review }
    end

    assert_redirected_to resolvedreviewdispute_path(assigns(:resolvedreviewdispute))
  end

  test "should show resolvedreviewdispute" do
    get :show, id: @resolvedreviewdispute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resolvedreviewdispute
    assert_response :success
  end

  test "should update resolvedreviewdispute" do
    patch :update, id: @resolvedreviewdispute, resolvedreviewdispute: { comment: @resolvedreviewdispute.comment, dispute_action: @resolvedreviewdispute.dispute_action, dispute_comment: @resolvedreviewdispute.dispute_comment, finalcomments: @resolvedreviewdispute.finalcomments, gps_review: @resolvedreviewdispute.gps_review, length_review: @resolvedreviewdispute.length_review, location_review: @resolvedreviewdispute.location_review, name_review: @resolvedreviewdispute.name_review, rating_difficulty_review: @resolvedreviewdispute.rating_difficulty_review, rating_duration_review: @resolvedreviewdispute.rating_duration_review, review_id: @resolvedreviewdispute.review_id, review_user_id: @resolvedreviewdispute.review_user_id, season_review: @resolvedreviewdispute.season_review, trail_id: @resolvedreviewdispute.trail_id, traildirections_review: @resolvedreviewdispute.traildirections_review, trailtype_review: @resolvedreviewdispute.trailtype_review }
    assert_redirected_to resolvedreviewdispute_path(assigns(:resolvedreviewdispute))
  end

  test "should destroy resolvedreviewdispute" do
    assert_difference('Resolvedreviewdispute.count', -1) do
      delete :destroy, id: @resolvedreviewdispute
    end

    assert_redirected_to resolvedreviewdisputes_path
  end
end
