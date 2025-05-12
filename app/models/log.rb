class Log < ApplicationRecord
  encrypts :trigger, :bad_thought, :emotion, :good_thought

  validates :date, presence: true
  validates :trigger, presence: true
  validates :bad_thought, presence: true
  validates :emotion, presence: true
  validates :good_thought, presence: true

  belongs_to :user
end
