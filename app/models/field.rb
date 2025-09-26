# == Schema Information
#
# Table name: fields
#
#  id         :bigint           not null, primary key
#  help_text  :string
#  prompt     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Field < ApplicationRecord
  validates :prompt, presence: true

  has_and_belongs_to_many :forms
  has_many :responses

  def short_prompt
    prompt.truncate(30)
  end
end
