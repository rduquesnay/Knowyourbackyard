require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @admin = users(:admin)
    @comment = comments(:one)
  end

  test "should get new" do
    sign_in(@user)
    get :new
    assert_response :success
  end

  test "should get create" do
  #  sign_in(@user)
  #  assert_difference('Comment.count') do
  #    post :create, comment: { message: @comment.message}
  #  end
  #  assert_redirected_to trail_path
  end

  test "should destory comment" do
    sign_in(@admin)
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end
  #  assert_redirected_to trail_path
  end

end
