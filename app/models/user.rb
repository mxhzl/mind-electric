class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable
  has_many :logs, dependent: :destroy

  validates :confirmation_token, uniqueness: true
  validates :unlock_token, uniqueness: true
  validates :reset_password_token, uniqueness: true
  validates :email, presence: true
end
