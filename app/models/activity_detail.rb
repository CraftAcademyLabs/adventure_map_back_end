class ActivityDetail < ApplicationRecord
  VALID_TYPE_VALUES = %w(Recording Waypoint Image)

  belongs_to :activity


  validates_presence_of :file_attachment, :attachment_type
  validates :attachment_type,
            inclusion: { in: VALID_TYPE_VALUES,
                         message: '"%{value}" is not a valid type' },
            allow_nil: false
end
