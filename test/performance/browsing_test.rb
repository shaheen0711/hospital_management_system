require 'test_helper'

class BrowsingTest < ActionDispatch::IntegrationTest
  test "health check and login page are available" do
    get rails_health_check_path
    assert_response :success

    get login_users_path
    assert_response :success
    assert_select "form[action='#{login_users_path}']"

    stylesheet_path = css_select("link[rel='stylesheet']").first["href"]
    get stylesheet_path
    assert_response :success
    assert_includes response.body, "font-family"
  end
end
