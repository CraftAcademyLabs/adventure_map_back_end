class AdminUser < ApplicationRecord
  include Godmin::Authentication::User

  validates :password, presence: true, length: {minimum: 6}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: true,
            format: {with: VALID_EMAIL_REGEX}
  validates_presence_of :first_name, :last_name

  def self.login_column
    :email
  end

  def name
    [self.first_name, self.last_name].join(' ')
  end


end