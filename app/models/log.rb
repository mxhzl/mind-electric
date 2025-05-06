class Log < ApplicationRecord
  validates :date, presence: true
  validates :trigger, presence: true
  validates :bad_thought, presence: true
  validates :emotion, presence: true
  validates :good_thought, presence: true
end
