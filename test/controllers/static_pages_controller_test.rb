require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  BASE_TITLE = "Ruby on Rails Tutorial Sample App".freeze

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", BASE_TITLE
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{BASE_TITLE}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{BASE_TITLE}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{BASE_TITLE}"
  end
end
