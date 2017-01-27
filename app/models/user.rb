class User < ActiveRecord::Base
  VALID_GENDER_VALUES = %w(Male Female Other)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :activities

  validates :gender,
            inclusion: {in: VALID_GENDER_VALUES,
                        message: '%{value} is not a valid gender'},
            allow_nil: true
end
