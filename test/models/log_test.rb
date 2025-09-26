# == Schema Information
#
# Table name: logs
#
#  id         :bigint           not null, primary key
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  form_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_logs_on_form_id  (form_id)
#  index_logs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (form_id => forms.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class LogTest < ActiveSupport::TestCase
  test "should not save log without required fields" do
    log = Log.new
    assert_not log.save
  end
end
