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
#  fk_rails_...  (form_id => forms.id)
#  fk_rails_...  (user_id => users.id)


class Log < ApplicationRecord
  validates :date, presence: true

  belongs_to :user
  belongs_to :form
  has_many :responses, dependent: :destroy
end
