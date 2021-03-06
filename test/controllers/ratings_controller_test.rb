require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  setup do
    @rating = ratings(:one)
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
    assert_difference('Rating.count') do
      post :create, rating: {difficulty: 3, durationinsec: 134, favourite: true, user_id: 3, trail_id: 1}
    end
    assert_redirected_to trail_path(1)
  end

  test "should destory rating" do
    sign_in(@admin)
  #  assert_difference('Rating.count', -1) do
  #    delete :destroy, id: @rating
  #  end
  #  assert_redirected_to trail_path(1)
  end

end
