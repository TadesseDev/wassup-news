require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get user_register_url
    assert_response :success
  end

  test "should get subscribe" do
    get user_subscribe_url
    assert_response :success
  end
end
