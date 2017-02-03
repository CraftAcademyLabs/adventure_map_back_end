class Activity < ApplicationRecord
  VALID_DIFFICULTY_VALUES = [1, 2, 3]
  VALID_CATEGORIES = User::VALID_INTERESTS
  validates_presence_of :title, :body, :difficulty
  validate :validate_category

  validates :difficulty,
            inclusion: {in: VALID_DIFFICULTY_VALUES,
                        message: '%{value} is not a valid value'}

  belongs_to :user

  def validate_category
    errors.add(:category) unless VALID_CATEGORIES.include? category
  end
end
