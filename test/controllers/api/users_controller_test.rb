class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should create a user" do
    post api_users_path(email: 'ralph@ralph.com', user_name: 'ralph', password: 'mUc3m00RsqyRe')
    assert_response :success
  end

  test "should log in a user" do
    post api_auth_login_path(user_name: @user.user_name, password: 'mUc3m00RsqyRe')
    assert_response :success
  end

  test "should reject a login with bad password" do
    post api_auth_login_path(user_name: 'test_user', password: 'ya123')
    assert_response 401
  end
end