json.status 'success'
json.users current_api_v1_user.all_following.each do |user|
  json.id user.id
  json.name user.name
  json.image user.image
  json.interests user.interests
end