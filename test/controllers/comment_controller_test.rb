require 'test_helper'

class CommentControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get add_nested" do
    get :add_nested
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
