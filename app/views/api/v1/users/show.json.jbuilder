json.status 'success'
json.user do
  json.id @user.id
  json.name @user.name
  json.nickname @user.nickname
  json.image @user.image
  json.interests @user.interests
  json.followers_count @user.followers.count
  json.following current_api_v1_user.following? @user
  json.activities @user.activities do |activity|
    json.id activity.id
    json.title activity.title
    json.body activity.body
    json.difficulty activity.difficulty
    json.category activity.category
    json.created_at activity.created_at.strftime('%e %B, %Y')
    json.comments_count activity.comments.count
    json.likes_count activity.followers_count
    json.saves_count activity.active_saves.count
    json.coords do
      json.lat activity.lat
      json.lng activity.lng
    end
  end
end