# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  field_id   :bigint           not null
#  log_id     :bigint           not null
#
# Indexes
#
#  index_responses_on_field_id  (field_id)
#  index_responses_on_log_id    (log_id)
#
# Foreign Keys
#
#  fk_rails_...  (field_id => fields.id)
#  fk_rails_...  (log_id => logs.id)
#
class Response < ApplicationRecord
  encrypts :text

  validates :text, presence: true

  belongs_to :log
  belongs_to :field
end
