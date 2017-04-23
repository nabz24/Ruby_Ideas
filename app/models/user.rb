class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true
  validates :password, length: {minimum: 8}, on: :create
  validates :email, presence:  true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  before_save :downcase_email, :name_uppercase
end
private
def downcase_email
  self.email.downcase!
end
def name_uppercase
  name.capitalize!
end
