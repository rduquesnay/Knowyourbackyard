require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { subject: @contact.subject, message: @contact.message, firstname: @contact.firstname, lastname: @contact.lastname, email: @contact.email, from_id: @contact.from_id, username: @contact.username }
    end

    assert_redirected_to root_path
  end

  test "should show contact" do
    sign_in(@admin)
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: {subject: @contact.subject, message: @contact.message, firstname: @contact.firstname, lastname: @contact.lastname, email: @contact.email, from_id: @contact.from_id, username: @contact.username }
    assert_redirected_to root_path
  end

  test "should destroy contact" do
    sign_in(@admin)
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
