require "test_helper"

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  test "login page renders a real login form" do
    get login_users_path

    assert_response :success
    assert_select "form[action='#{login_users_path}'][method='post']", 1
    assert_select "input[name='user[username]']", 1
    assert_select "input[name='user[password]']", 1
  end

  test "admin user can authenticate with valid credentials" do
    User.create!(
      first_name: "Admin",
      last_name: "User",
      username: "shaheen@gmail.com",
      user_type: "admin",
      password: "abc123"
    )

    assert_not_nil User.authenticate({ username: "shaheen@gmail.com", password: "abc123" })
  end
end
