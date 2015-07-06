require 'test_helper'

class VideomakerSubmissionsControllerTest < ActionController::TestCase
  setup do
    @videomaker_submission = videomaker_submissions(:one)
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in(@admin)
  #  get :index
  #  assert_response :success
  #  assert_not_nil assigns(:videomaker_submissions)
  end

  test "should get new" do
    sign_in(@user)
    get :new
    assert_response :success
  end

  test "should create videomaker_submission" do
    sign_in(@user)
  #  assert_difference('VideomakerSubmission.count') do
  #    post :create, videomaker_submission: { about: @videomaker_submission.about, demo_link: @videomaker_submission.demo_link, user_id: @videomaker_submission.user_id }
  #  end

  #  assert_redirected_to videomaker_submission_path(assigns(:videomaker_submission))
  end

  test "should show videomaker_submission" do
    sign_in(@user)
    get :show, id: @videomaker_submission
    assert_response :success
  end

  test "should get edit" do
    sign_in(@user)
  #  get :edit, id: @videomaker_submission
  #  assert_response :success
  end

  test "should update videomaker_submission" do
    sign_in(@user)
    patch :update, id: @videomaker_submission, videomaker_submission: { about: @videomaker_submission.about, demo_link: @videomaker_submission.demo_link, user_id: @videomaker_submission.user_id }
    assert_redirected_to videomaker_submission_path(assigns(:videomaker_submission))
  end

  test "should destroy videomaker_submission" do
    sign_in(@admin)
    assert_difference('VideomakerSubmission.count', -1) do
      delete :destroy, id: @videomaker_submission
    end

    assert_redirected_to videomaker_submissions_path
  end
end
