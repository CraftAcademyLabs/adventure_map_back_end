class ActivityDetail < ApplicationRecord
  belongs_to :activity, dependent: :destroy
end
