require 'test_helper'

class AdvertisersControllerTest < ActionController::TestCase
  setup do
    @advertiser = advertisers(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success 
    assert_not_nil assigns(:advertisers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create advertiser" do
    assert_difference('Advertiser.count') do
      post :create, advertiser: { email: "test@testr.com", message: "message", name: "name", phone: "997-0456" }
    end

    assert_redirected_to root_path
  end

  test "should show advertiser" do
    sign_in(@admin)
    get :show, id: @advertiser
    assert_response :success 
  end

  test "should get edit" do
    get :edit, id: @advertiser
    assert_response :success
  end

  test "should update advertiser" do
    patch :update, id: @advertiser, advertiser: { email: "test@test.com", message: "message", name: "name", phone: "phone" }
    assert_response :success
  end

  test "should destroy advertiser" do
    sign_in(@admin)
    assert_difference('Advertiser.count', -1) do
      delete :destroy, id: @advertiser
    end
    assert_redirected_to advertisers_path
  end
end
