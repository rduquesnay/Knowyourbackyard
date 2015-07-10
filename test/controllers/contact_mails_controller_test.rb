require 'test_helper'

class ContactMailsControllerTest < ActionController::TestCase
  setup do
    @admin = users(:admin)
  end

  test "should get new" do
    sign_in(@admin)
    get :new, contact_id: 1
    assert_response :success
  end

  test "should create mail" do
    sign_in(@admin)

    assert_response :success
  end

end
