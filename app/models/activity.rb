class Activity < ApplicationRecord
  VALID_DIFFICULTY_VALUES = [1, 2, 3]
  validates_presence_of :title, :body, :difficulty

  validates :difficulty,
            inclusion: {in: VALID_DIFFICULTY_VALUES,
                        message: '%{value} is not a valid value'}
end
