class User < ActiveRecord::Base
  VALID_GENDER_VALUES = %w(Male Female Other)
  VALID_INTERESTS = %w{ Hiking Cross\ country\ skiing Back\ country\ skiing Paddling
  Mountain\ biking Horse\ riding Climbing Snow\ mobiling Cross\ country\ ice\ skating
  Foraging }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  acts_as_taggable_on :interests
  include DeviseTokenAuth::Concerns::User


  has_many :activities

  validates :gender,
            inclusion: {in: VALID_GENDER_VALUES,
                        message: '%{value} is not a valid gender'},
            allow_nil: true
end
