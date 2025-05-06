require "test_helper"

class LogTest < ActiveSupport::TestCase
  test "should not save log without required fields" do
    log = Log.new
    assert_not log.save
  end
end
