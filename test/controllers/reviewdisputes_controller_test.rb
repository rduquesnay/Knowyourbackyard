require 'test_helper'

class ReviewdisputesControllerTest < ActionController::TestCase
  setup do
    @reviewdispute = reviewdisputes(:one)
    @user = users(:one)
    @admin = users(:admin)
    @tb = users(:tb)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:reviewdisputes)
  end

  test "should get new" do
    sign_in(@user)
    get :new
    assert_response :success
  end

  test "should create reviewdispute" do
    sign_in(@user)
    assert_difference('Reviewdispute.count') do
      post :create, reviewdispute: { comment: @reviewdispute.comment, review_id: @reviewdispute.review_id }
    end

    assert_redirected_to root_path
  end

  test "should show reviewdispute" do
    sign_in(@tb)
    get :show, id: @reviewdispute
    assert_response :success
  end

  test "should get edit" do
    sign_in(@user)
    get :edit, id: @reviewdispute
    assert_response :success
  end

  test "should update reviewdispute" do
    sign_in(@user)
    patch :update, id: @reviewdispute, reviewdispute: { comment: @reviewdispute.comment, review_id: @reviewdispute.review_id }
    assert_redirected_to reviewdispute_path(assigns(:reviewdispute))
  end

  test "should destroy reviewdispute" do
    sign_in(@tb)
    assert_difference('Reviewdispute.count', -1) do
      delete :destroy, id: @reviewdispute
    end

    assert_redirected_to reviewdisputes_path
  end
end
