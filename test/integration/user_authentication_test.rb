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
    user = create_user(username: "admin@example.com", password: "abc123")

    post login_users_path, params: { user: { username: user.username, password: "abc123" } }

    assert_redirected_to users_path
    assert_equal user.id, session[:user_id]
  end

  test "login rejects an incorrect password" do
    user = create_user(username: "admin@example.com", password: "abc123")

    post login_users_path, params: { user: { username: user.username, password: "incorrect" } }

    assert_response :success
    assert_nil session[:user_id]
    assert_select ".login"
  end

  test "logout clears the session" do
    user = create_user(username: "admin@example.com", password: "abc123")
    post login_users_path, params: { user: { username: user.username, password: "abc123" } }

    get logout_users_path

    assert_redirected_to users_path
    assert_nil session[:user_id]
  end

  test "patient can register an account" do
    post signup_users_path, params: {
      user: {
        first_name: "Pat",
        last_name: "Patient",
        username: "pat@example.com",
        password: "patient-password"
      }
    }

    assert_redirected_to login_users_path
    user = User.find_by!(username: "pat@example.com")
    assert_equal "patient", user.user_type
    assert user.has_password?("patient-password")
  end

  private

  def create_user(username:, password:)
    User.create!(
      first_name: "Admin",
      last_name: "User",
      username: username,
      user_type: "admin",
      password: password
    )
  end
end
