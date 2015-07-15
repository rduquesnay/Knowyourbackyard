require 'test_helper'

class ResolvedreviewdisputesControllerTest < ActionController::TestCase
  setup do
    @resolvedreviewdispute = resolvedreviewdisputes(:one)
    @user = users(:one)
    @admin = users(:admin)
    @tb = users(:tb)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:resolvedreviewdisputes)
  end

  test "should get new" do
    sign_in(@tb)
    get :new, trail_id: 1, review_id: 1, dispute_id: 1
    assert_response :success
  end

  test "should create resolvedreviewdispute" do
    sign_in(@tb)
  #  assert_difference('Resolvedreviewdispute.count') do
  #    post :create, resolvedreviewdispute: { comment: @resolvedreviewdispute.comment, dispute_action: @resolvedreviewdispute.dispute_action, dispute_comment: @resolvedreviewdispute.dispute_comment, finalcomments: @resolvedreviewdispute.finalcomments, gps_review: @resolvedreviewdispute.gps_review, length_review: @resolvedreviewdispute.length_review, location_review: @resolvedreviewdispute.location_review, name_review: @resolvedreviewdispute.name_review, rating_difficulty_review: @resolvedreviewdispute.rating_difficulty_review, rating_duration_review: @resolvedreviewdispute.rating_duration_review, review_id: @resolvedreviewdispute.review_id, review_user_id: @resolvedreviewdispute.review_user_id, season_review: @resolvedreviewdispute.season_review, trail_id: @resolvedreviewdispute.trail_id, traildirections_review: @resolvedreviewdispute.traildirections_review, trailtype_review: @resolvedreviewdispute.trailtype_review}, dispute_id: 1
  #  end

  #  assert_redirected_to resolvedreviewdispute_path(assigns(:resolvedreviewdispute))
  end

  test "should show resolvedreviewdispute" do
    sign_in(@user)
    get :show, id: @resolvedreviewdispute
    assert_response :success
  end


  test "should destroy resolvedreviewdispute" do
    sign_in(@admin)
    assert_difference('Resolvedreviewdispute.count', -1) do
      delete :destroy, id: @resolvedreviewdispute
    end

    assert_redirected_to resolvedreviewdisputes_path
  end
end
