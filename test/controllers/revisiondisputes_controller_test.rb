require 'test_helper'

class RevisiondisputesControllerTest < ActionController::TestCase
  setup do
    @revisiondispute = revisiondisputes(:one)
    @user = users(:one)
    @admin = users(:admin)
    @tb = users(:tb)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:revisiondisputes)
  end

  test "should get new" do
    sign_in(@user)
    get :new
    assert_response :success
  end

  test "should create revisiondispute" do
    sign_in(@user)
    assert_difference('Revisiondispute.count') do
      post :create, revisiondispute: { comment: @revisiondispute.comment, revisionreview_id: @revisiondispute.revisionreview_id }
    end

    assert_redirected_to root_path
  end

  test "should show revisiondispute" do
    sign_in(@tb)
    get :show, id: @revisiondispute
    assert_response :success
  end

  test "should get edit" do
    sign_in(@user)
    get :edit, id: @revisiondispute
    assert_response :success
  end

  test "should update revisiondispute" do
    sign_in(@user)
    patch :update, id: @revisiondispute, revisiondispute: { comment: @revisiondispute.comment, revisionreview_id: @revisiondispute.revisionreview_id }
    assert_redirected_to revisiondispute_path
  end

  test "should destroy revisiondispute" do
    sign_in(@tb)
    assert_difference('Revisiondispute.count', -1) do
      delete :destroy, id: @revisiondispute
    end

    assert_redirected_to revisiondisputes_path
  end
end
