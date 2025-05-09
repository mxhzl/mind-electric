require "test_helper"

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get logs_path
    assert_response :success
  end

  test "should show log associated with user" do
    log = logs(:one)
    get log_path(log)
    assert_response :success
  end

  test "should redirect if user doesn't have access to that log" do
    log = logs(:two)
    get log_path(log)
    assert_redirected_to root_path
  end
end
