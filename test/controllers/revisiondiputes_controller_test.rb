require 'test_helper'

class RevisiondiputesControllerTest < ActionController::TestCase
  setup do
    @revisiondipute = revisiondiputes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:revisiondiputes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create revisiondipute" do
    assert_difference('Revisiondipute.count') do
      post :create, revisiondipute: { comment: @revisiondipute.comment, revisionreview_id: @revisiondipute.revisionreview_id }
    end

    assert_redirected_to revisiondipute_path(assigns(:revisiondipute))
  end

  test "should show revisiondipute" do
    get :show, id: @revisiondipute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @revisiondipute
    assert_response :success
  end

  test "should update revisiondipute" do
    patch :update, id: @revisiondipute, revisiondipute: { comment: @revisiondipute.comment, revisionreview_id: @revisiondipute.revisionreview_id }
    assert_redirected_to revisiondipute_path(assigns(:revisiondipute))
  end

  test "should destroy revisiondipute" do
    assert_difference('Revisiondipute.count', -1) do
      delete :destroy, id: @revisiondipute
    end

    assert_redirected_to revisiondiputes_path
  end
end
