require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  test "should destroy Notification" do
    @request.env['HTTP_REFERER'] = root_path 
    @note = notifications(:one)
    assert_difference('Notification.count', -1) do
      delete :destroy, id: @note
    end
    assert_redirected_to root_path
  end
end
