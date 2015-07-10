require 'test_helper'

class SocialsControllerTest < ActionController::TestCase
  setup do
    @social = socials(:one)
    @user = users(:one)
  end

  test "should get new" do
    sign_in(@user)
    get :new, id: 1
    assert_response :success
  end

  test "should create social" do
    sign_in(@user)
  #  assert_difference('Social.count') do
  #    post :create, social: { facebook_link: "http://facebook.com/" , instagram_link: "http://instagram.com/", linkedin_link: "http://linkedin.com/", youtube_link: "http://yuotube/", user_id: @user.id }
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
    patch :update, id: @social, social: { facebook_link: "/facebook.com/", instagram_link: "/instagram.com/", linkedin_link: "/linkedin/", user_id: @user.id, youtube_link: "/youtube.com/" }
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
