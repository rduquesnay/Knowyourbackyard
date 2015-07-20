require 'test_helper'

class LogosControllerTest < ActionController::TestCase
  setup do
    @logo = logos(:one)
    @owner = users(:owner)
  end

  test "should get new" do
    sign_in(@owner)
    get :new, id: 1
    assert_response :success
  end

  test "should create logo" do
    sign_in(@owner)
  #  assert_difference('Logo.count') do
  #    post :create, logo: { url: @logo.url }
  #  end

  #  assert_redirected_to sponsors_path
  end

  test "should get edit" do
    sign_in(@owner)
    get :edit, id: @logo
    assert_response :success
  end

  test "should update logo" do
    sign_in(@owner)
  #  patch :update, id: @logo, logo: { url: @logo.url }
  #  assert_redirected_to sponsors_path
  end

  test "should destroy logo" do
    sign_in(@owner)
  #  assert_difference('Logo.count', -1) do
  #    delete :destroy, id: @logo
  #  end

  #  assert_redirected_to logos_path
  end
end
