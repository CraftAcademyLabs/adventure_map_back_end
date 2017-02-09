json.status 'success'
json.data @activities.each do |activity|
  json.title activity.title
  json.body activity.body.truncate_words(75)
  json.difficulty activity.difficulty
  json.category activity.category
  json.created_at activity.created_at.strftime('%e %B, %Y')
  json.user do
    json.id activity.user.id
    json.name activity.user.name
    json.image activity.user.image
    json.interests activity.user.interests
    end
end
