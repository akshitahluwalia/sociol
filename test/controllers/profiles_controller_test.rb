require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get profile:get" do
    get :profile : get
    assert_response :success
  end

  test "should get update:post" do
    get :update : post
    assert_response :success
  end

end
