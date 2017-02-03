json.status 'success'
@activities.each do |activity|
  json.title activity.title
  json.body activity.body
  json.difficulty activity.difficulty
  json.category activity.category
  json.user activity.user
end