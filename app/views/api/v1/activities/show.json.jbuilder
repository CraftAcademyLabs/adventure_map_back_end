json.status 'success'
json.data do
  json.id @activity.id
  json.title @activity.title
  json.body @activity.body
  json.difficulty @activity.difficulty
  json.category @activity.category

  json.user @activity.user
  json.images @activity.activity_details.collect { |detail| detail if detail.attachment_type == 'Image' }
end
