require 'test_helper'

class UsersSigninTest < ActionDispatch::IntegrationTest
	def setup
    @user = users(:yellow)
  end

  test "sign in with invalid information" do
    get signin_path
    assert_template 'static_pages/signin'
    post signin_path, session: { email: "", password: "" }
    assert_template 'static_pages/signin'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "sign in with valid information followed by logout" do
    get signin_path
    post signin_path, session: { email: @user.email, password: 'password' }
    assert is_logged_in?
    assert_redirected_to user_url(@user)
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", signin_path, count: 0
    assert_select "a[href=?]", signup_path, count: 0
    assert_select "a[href=?]", signout_path
    assert_select "a[href=?]", user_url(@user)
    delete signout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", signin_path
    assert_select "a[href=?]", signout_path,    count: 0
    assert_select "a[href=?]", user_url(@user), count: 0
  end
end