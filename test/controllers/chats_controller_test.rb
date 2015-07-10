require 'test_helper'

class ChatsControllerTest < ActionController::TestCase
  setup do
    @chat = chats(:one)
    @user = users(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:chats)
  end

  test "should get new" do
  #  get :new, contact_id: Contact.all.first 
  #  assert_response :success
  end

  test "should show chat" do
    sign_in(@user)
  #  get :show, id: @chat
  #  assert_response :success
  end

  test "should destroy chat" do
    sign_in(@admin)
    assert_difference('Chat.count', -1) do
      delete :destroy, id: @chat
    end
    assert_redirected_to chats_path
  end
end
