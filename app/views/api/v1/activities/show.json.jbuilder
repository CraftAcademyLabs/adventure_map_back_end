json.status 'success'
json.data do
  json.title @activity.title
  json.body @activity.body
  json.difficulty @activity.difficulty
  json.category @activity.category

  json.user @activity.user

  json.activityDetails @activity.activity_details :id
end
