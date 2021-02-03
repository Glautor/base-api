class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
  validates_confirmation_of :password
  has_many :comments
  has_many :posts

  enum profile: {
    admin: 0,
    normal_user: 1
  }
end
