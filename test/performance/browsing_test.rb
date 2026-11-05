require 'test_helper'

class BrowsingTest < ActionDispatch::IntegrationTest
  test "health check and login page are available" do
    get rails_health_check_path
    assert_response :success

    get login_users_path
    assert_response :success
    assert_select "form[action='#{login_users_path}']"
  end
end
