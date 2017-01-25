class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  VALID_SEX_VALUES = %w(Male Female Other)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :activities

  validates :gender,
            inclusion: {in: VALID_SEX_VALUES,
                        message: '%{value} is not a valid gender'},
            allow_nil: true
end
