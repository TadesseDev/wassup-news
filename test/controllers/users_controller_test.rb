require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get users_register_url
    assert_response :success
  end

  test "should get subscribe" do
    get users_subscribe_url
    assert_response :success
  end
end
