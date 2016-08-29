class User < ActiveRecord::Base
	has_many :posts
	has_many :likes, dependent: :destroy
	has_many :posts_liked, through: :likes, source: :post

  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
  validates_confirmation_of :password, :password_confirmation
end
