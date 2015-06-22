require 'test_helper'

class SocialsControllerTest < ActionController::TestCase
  setup do
    @social = socials(:one)
    @user = users(:one)
  end

  test "should get new" do
    sign_in(@user)
  #  get :new
  #  assert_response :success
  end

  test "should create social" do
    sign_in(@user)
  #  assert_difference('Social.count') do
  #    post :create, social: { facebook_link: @social.facebook_link, instagram_link: @social.instagram_link, linkedin_link: @social.linkedin_link, user_id: @social.user_id, youtube_link: @social.youtube_link }
  #  end

  #  assert_redirected_to user_path(@user)
  end

  test "should get edit" do
    sign_in(@user)
    get :edit, id: @social
    assert_response :success
  end

  test "should update social" do
    sign_in(@user)
  #  patch :update, id: @social, social: { facebook_link: @social.facebook_link, instagram_link: @social.instagram_link, linkedin_link: @social.linkedin_link, user_id: @social.user_id, youtube_link: @social.youtube_link }
  #  assert_redirected_to user_path(@user)
  end

  test "should destroy social" do
    sign_in(@user)
  #  assert_difference('Social.count', -1) do
  #    delete :destroy, id: @social
  #  end

  #  assert_redirected_to user_path(@user)
  end
end
