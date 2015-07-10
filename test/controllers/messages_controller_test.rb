require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should get new" do
    sign_in(@user)
    get :new
    assert_response :success
  end

  test "should get create" do
    sign_in(@user)
  #  assert_difference('Message.count') do
  #    post :create, message: {content: @message.content, user_id: @message.user_id, chat_id: @message.chat_id}
  #  end
  #  assert_redirected_to chat_path
  end

  test "should destory message" do
    sign_in(@admin)
  #  assert_difference('Message.count', -1) do
  #    delete :destroy, id: @message
  #  end
  #  assert_redirected_to chat_path(1)
  end
end
