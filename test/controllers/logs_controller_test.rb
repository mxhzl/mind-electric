require "test_helper"

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get logs_url
    assert_response :success
  end

  test "should show log associated with user" do
    log = logs(:one)
    get log_url(log)
    assert_response :success
  end

  test "should redirect if user doesn't have access to that log" do
    log = logs(:two)
    get log_url(log)
    assert_redirected_to root_url
  end
end
