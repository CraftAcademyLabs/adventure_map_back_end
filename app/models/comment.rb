class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  validates :body, presence: true
end
