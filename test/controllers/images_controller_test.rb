require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @image = images(:one)
    @user = users(:one)
    @tb = users(:tb)
  end

  test "should get index" do
    sign_in(@tb)
  #  get :index
  #  assert_response :success
  #  assert_not_nil assigns(:images)
  end

  test "should get new" do
  #  sign_in(@user)
  #  get :new
  #  assert_response :success
  end

  test "should create image" do
    sign_in(@user)
   # assert_difference('Image.count') do
   #   post :create, image: { trail_id: @image.trail_id, url: @image.url }
   # end

   # assert_redirected_to image_path(assigns(:image))
  end

  test "should show image" do
    sign_in(@tb)
   # get :show, id: @image
   # assert_response :success
  end

  test "should get edit" do
    sign_in(@tb)
  #  get :edit, id: @image
  #  assert_response :success
  end

  test "should update image" do
    sign_in(@tb)
  #  patch :update, id: @image, image: { trail_id: @image.trail_id, url: @image.url }
  #  assert_redirected_to image_path(assigns(:image))
  end

  test "should destroy image" do
    sign_in(@tb)
  #  assert_difference('Image.count', -1) do
  #    delete :destroy, id: @image
  #  end

  #  assert_redirected_to images_path
  end
end
