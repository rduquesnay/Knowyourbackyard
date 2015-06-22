require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  setup do
    @video = videos(:one)
    @trail = trails(:one)
    @admin = users(:admin)
  end

  test "should get new" do
    sign_in(@admin)
    get :new
    assert_response :success
  end

  test "should create video" do
    sign_in(@admin)
  #  assert_difference('Video.count') do
  #    post :create, video: { src: @video.src, trail_id: @trail }
  #  end

  #  assert_redirected_to trail_path
  end

  test "should destroy video" do
  #  sign_in(@admin)
  #  assert_difference('Video.count', -1) do
  #    delete :destroy, id: @video
  #  end

  #  assert_redirected_to trail_path
  end
end
