require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get sign-in" do
    get :sign-in
    assert_response :success
  end

  test "should get sign-up" do
    get :sign-up
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get newsfeed" do
    get :newsfeed
    assert_response :success
  end

end
