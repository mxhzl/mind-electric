# == Schema Information
#
# Table name: fields
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  help_text    :string
#  key          :string           not null
#  prompt       :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_fields_on_discarded_at  (discarded_at)
#  index_fields_on_key           (key) UNIQUE
#

class Field < ApplicationRecord
  include Discard::Model

  validates :prompt, presence: true
  validates :key, presence: true, uniqueness: true

  has_and_belongs_to_many :forms
  has_many :responses

  def short_prompt
    prompt.truncate(30)
  end
end
