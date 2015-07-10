require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
    @user = users(:one)
    @admin = users(:admin)
    @tb = users(:tb)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    sign_in(@tb)
  #  get :new, trail_id: 1
  #  assert_response :success
  end

  test "should create review" do
    sign_in(@tb)
  #  assert_difference('Review.count') do
  #    post :create, review: { finalcomments: @review.finalcomments, gps_review: @review.gps_review, location_review: @review.location_review, name_review: @review.name_review, user_id: @review.user_id, rating_difficulty_review: @review.rating_difficulty_review, rating_duration_review: @review.rating_duration_review, season_review: @review.season_review, trail_id: @review.trail_id, traildirections_review: @review.traildirections_review, trailtype_review: @review.trailtype_review }
  #  end
  #  assert_redirected_to trail_path(@review.trail_id)
  end

  test "should show review" do
    sign_in(@user)
  #  get :show, id: @review
  #  assert_response :success
  end

  test "should get edit" do
    sign_in(@tb)
  #  get :edit, id: @review.id
  #  assert_response :success
  end

  test "should update review" do
    sign_in(@tb)
    patch :update, id: @review, review: { finalcomments: @review.finalcomments, gps_review: @review.gps_review, location_review: @review.location_review, name_review: @review.name_review, user_id: @review.user_id, rating_difficulty_review: @review.rating_difficulty_review, rating_duration_review: @review.rating_duration_review, season_review: @review.season_review, trail_id: @review.trail_id, traildirections_review: @review.traildirections_review, trailtype_review: @review.trailtype_review }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    sign_in(@tb)
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
