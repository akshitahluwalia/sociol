require 'test_helper'

class ReactionControllerTest < ActionController::TestCase
  test "should get like" do
    get :like
    assert_response :success
  end

  test "should get happy" do
    get :happy
    assert_response :success
  end

  test "should get sad" do
    get :sad
    assert_response :success
  end

  test "should get andry" do
    get :andry
    assert_response :success
  end

end
