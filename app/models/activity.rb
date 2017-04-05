class Activity < ApplicationRecord
  VALID_DIFFICULTY_VALUES = [1, 2, 3]
  VALID_CATEGORIES = User::VALID_INTERESTS
  validates_presence_of :title, :body, :difficulty
  validate :validate_category

  validates :difficulty,
            inclusion: { in: VALID_DIFFICULTY_VALUES,
                         message: '%{value} is not a valid value' }

  belongs_to :user
  has_many :activity_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saved_activities, dependent: :destroy
  acts_as_followable

  def validate_category
    errors.add(:category) unless VALID_CATEGORIES.include? category
  end
end
