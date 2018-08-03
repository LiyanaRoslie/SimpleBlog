class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, email: {strict_mode: true}
  validates :password, presence: true

  has_many :articles
end
