require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "not login layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2

    assert_select "a[href=?]", help_path
    get help_path
    assert_select "title", full_title("Help")

    assert_select "a[href=?]", about_path
    get about_path
    assert_select "title", full_title("About")

    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")

    assert_select "a[href=?]", login_path
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test "login layout links" do
    log_in_as(@user)
    get root_path
    assert_template "static_pages/home"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", logout_path
  end
end
