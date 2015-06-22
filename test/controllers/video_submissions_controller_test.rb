require 'test_helper'

class VideoSubmissionsControllerTest < ActionController::TestCase
  setup do
    @video_submission = video_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_submissions)
  end

  test "should get new" do
  #  get :new
  #  assert_response :success
  end

  test "should create video_submission" do
  #  assert_difference('VideoSubmission.count') do
  #    post :create, video_submission: { demo_link: @video_submission.demo_link, trail_id: @video_submission.trail_id }
  #  end

  #  assert_redirected_to video_submission_path(assigns(:video_submission))
  end

  test "should show video_submission" do
  #  get :show, id: @video_submission
  #  assert_response :success
  end

  test "should get edit" do
  #  get :edit, id: @video_submission
  #  assert_response :success
  end

  test "should update video_submission" do
    patch :update, id: @video_submission, video_submission: { demo_link: @video_submission.demo_link, trail_id: @video_submission.trail_id }
    assert_redirected_to video_submission_path(assigns(:video_submission))
  end

  test "should destroy video_submission" do
    assert_difference('VideoSubmission.count', -1) do
      delete :destroy, id: @video_submission
    end

    assert_redirected_to video_submissions_path
  end
end
