# == Schema Information
#
# Table name: forms
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(FALSE), not null
#  discarded_at :datetime
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_forms_on_discarded_at     (discarded_at)
#  index_forms_on_name_and_active  (name,active) UNIQUE
#

class Form < ApplicationRecord
  include Discard::Model

  validates :name, presence: true
  validates :name, uniqueness: { scope: :active }

  has_and_belongs_to_many :fields
  has_many :logs

  scope :active, -> { kept.where(active: true) }
end
