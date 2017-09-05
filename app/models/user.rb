class User < ActiveRecord::Base
  VALID_GENDER_VALUES = %w(Male Female Other)
  VALID_INTERESTS = %w{ Hiking Cross\ country\ skiing Back\ country\ skiing Paddling
  Mountain\ biking Horse\ riding Climbing Snow\ mobiling Cross\ country\ ice\ skating
  Foraging }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  acts_as_taggable_on :interests
  acts_as_followable
  acts_as_follower
  include DeviseTokenAuth::Concerns::User
  has_many :activities, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saved_activities, dependent: :destroy

  validates :email, uniqueness: true
  validates :gender,
            inclusion: {in: VALID_GENDER_VALUES,
                        message: '%{value} is not a valid gender'},
            allow_nil: true

  validate :valid_interests

  def name
    [self.first_name, self.last_name].join(' ')
  end


  def valid_interests
    if self.interest_list.any?
      self.interest_list.each do |interest|
        self.errors[:interests] << "#{interest} is not a valid selection" unless VALID_INTERESTS.include?(interest)
      end
    end
  end

  def my_saved_activities
    activities = []
    self.saved_activities.each do |activity|
      # Only add activities the user has not un-saved
      activities << activity.activity if activity.active == true
    end
    activities
  end
end
