require 'test_helper'

class VideoSubmissionsControllerTest < ActionController::TestCase
  setup do
    @video_submission = video_submissions(:one)
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in(@admin)
  #  get :index
  #  assert_response :success
  #  assert_not_nil assigns(:video_submissions)
  end

  test "should get new" do
    sign_in(@user)
  #  get :new, id: 1
  #  assert_response :success
  end

  test "should create video_submission" do
    sign_in(@user)
  #  assert_difference('VideoSubmission.count') do
  #    post :create, video_submission: { demo_link: "demolink", trail_id: 1}
  #  end

  #  assert_redirected_to trail_path(1)
  end

  test "should show video_submission" do
    sign_in(@admin)
  #  get :show, id: @video_submission
  #  assert_response :success
  end

  test "should get edit" do
    sign_in(@user)
  #  get :edit, id: @video_submission
  #  assert_response :success
  end

  test "should update video_submission" do
    sign_in(@user)
    patch :update, id: @video_submission, video_submission: { demo_link: @video_submission.demo_link, trail_id: @video_submission.trail_id }
    assert_redirected_to video_submission_path(assigns(:video_submission))
  end

  test "should destroy video_submission" do
    sign_in(@admin)
    assert_difference('VideoSubmission.count', -1) do
      delete :destroy, id: @video_submission
    end

    assert_redirected_to video_submissions_path
  end
end
