require 'test_helper'

class ResolvedrevisiondisputesControllerTest < ActionController::TestCase
  setup do
    @resolvedrevisiondispute = resolvedrevisiondisputes(:one)
    @user = users(:one)
    @admin = users(:admin)
    @tb = users(:tb)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:resolvedrevisiondisputes)
  end

  test "should get new" do
    sign_in(@tb)
    get :new, trail_id: 1,revision_id: 1, review_id: 1, dispute_id: 1
    assert_response :success
  end

  test "should create resolvedrevisiondispute" do
    sign_in(@tb)
  #  assert_difference('Resolvedrevisiondispute.count') do
  #    post :create, resolvedrevisiondispute: { comment: @resolvedrevisiondispute.comment, dispute_action: @resolvedrevisiondispute.dispute_action, dispute_comment: @resolvedrevisiondispute.dispute_comment, finalcomments: @resolvedrevisiondispute.finalcomments, gps_review: @resolvedrevisiondispute.gps_review, length_review: @resolvedrevisiondispute.length_review, location_review: @resolvedrevisiondispute.location_review, name_review: @resolvedrevisiondispute.name_review, review_id: @resolvedrevisiondispute.review_id, review_user_id: @resolvedrevisiondispute.review_user_id, revisied_latitude: @resolvedrevisiondispute.revisied_latitude, revisied_location: @resolvedrevisiondispute.revisied_location, revisied_longitude: @resolvedrevisiondispute.revisied_longitude, revisied_name: @resolvedrevisiondispute.revisied_name, revisied_season: @resolvedrevisiondispute.revisied_season, revisied_traildirections: @resolvedrevisiondispute.revisied_traildirections, revisied_trailtype: @resolvedrevisiondispute.revisied_trailtype, revision_id: @resolvedrevisiondispute.revision_id, season_review: @resolvedrevisiondispute.season_review, trail_id: @resolvedrevisiondispute.trail_id, traildirections_review: @resolvedrevisiondispute.traildirections_review, trailtype_review: @resolvedrevisiondispute.trailtype_review }, dispute_id: 1
  #  end

  #  assert_redirected_to resolvedrevisiondispute_path(assigns(:resolvedrevisiondispute))
  end

  test "should show resolvedrevisiondispute" do
    sign_in(@user)
    get :show, id: @resolvedrevisiondispute
    assert_response :success
  end


  test "should destroy resolvedrevisiondispute" do
    sign_in(@admin)
    assert_difference('Resolvedrevisiondispute.count', -1) do
      delete :destroy, id: @resolvedrevisiondispute
    end

    assert_redirected_to resolvedrevisiondisputes_path
  end
end
