json.status 'success'
json.data do
  json.id @activity.id
  json.title @activity.title
  json.body @activity.body
  json.difficulty @activity.difficulty
  json.category @activity.category
  json.user @activity.user

  json.comments @activity.comments do |comment|
    json.id comment.id
    json.body comment.body
    json.activity_id comment.activity_id
    json.created_at comment.created_at
    json.updated_at comment.updated_at
    json.user comment.user, :id, :name, :nickname, :image
  end

  json.images @activity.activity_details.collect { |detail| detail if detail.attachment_type == 'Image' }
  json.waypoints @activity.activity_details.collect { |detail| detail if detail.attachment_type == 'Waypoint' }
  json.routes @activity.activity_details.collect { |detail| detail if detail.attachment_type == 'Route' }
end
