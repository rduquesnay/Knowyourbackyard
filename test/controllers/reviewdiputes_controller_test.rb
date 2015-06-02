require 'test_helper'

class ReviewdiputesControllerTest < ActionController::TestCase
  setup do
    @reviewdipute = reviewdiputes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviewdiputes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reviewdipute" do
    assert_difference('Reviewdipute.count') do
      post :create, reviewdipute: { comment: @reviewdipute.comment, review_id: @reviewdipute.review_id }
    end

    assert_redirected_to reviewdipute_path(assigns(:reviewdipute))
  end

  test "should show reviewdipute" do
    get :show, id: @reviewdipute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reviewdipute
    assert_response :success
  end

  test "should update reviewdipute" do
    patch :update, id: @reviewdipute, reviewdipute: { comment: @reviewdipute.comment, review_id: @reviewdipute.review_id }
    assert_redirected_to reviewdipute_path(assigns(:reviewdipute))
  end

  test "should destroy reviewdipute" do
    assert_difference('Reviewdipute.count', -1) do
      delete :destroy, id: @reviewdipute
    end

    assert_redirected_to reviewdiputes_path
  end
end
