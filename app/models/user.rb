class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :events, through: :joins, source: :event

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :city, :state, presence: true
end
