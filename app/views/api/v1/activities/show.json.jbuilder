json.status 'success'
json.data do
  json.id @activity.id
  json.title @activity.title
  json.body @activity.body
  json.difficulty @activity.difficulty
  json.category @activity.category
  json.created_at @activity.created_at.strftime('%e %B, %Y')
  json.comments_count @activity.comments.count
  json.likes_count @activity.followers_count
  json.saves_count @activity.active_saves.count
  json.user do
    json.id @activity.user.id
    json.name @activity.user.name
    json.image @activity.user.image
    json.interests @activity.user.interests
    json.followers_count @activity.user.followers.count
    json.following current_api_v1_user.following? @activity.user
    json.likes current_api_v1_user.following? @activity
    json.saves current_api_v1_user.my_saved_activities.include?(@activity)
  end

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
