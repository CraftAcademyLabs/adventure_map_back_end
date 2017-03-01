json.status 'success'
json.data @activities.each do |activity|
  json.id activity.id
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
    json.followers_count activity.user.followers.count
    json.following current_api_v1_user.following? activity.user
  end
  json.comments_count  activity.comments.count
  json.images activity.activity_details.collect { |detail| detail if detail.attachment_type == 'Image' }

end
