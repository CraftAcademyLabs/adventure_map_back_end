json.status 'success'
json.activity do
  json.title @activity.title
  json.body @activity.body
  json.difficulty @activity.difficulty
  json.category @activity.category
  json.user_id @activity.user.id
end