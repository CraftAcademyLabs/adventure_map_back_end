json.status 'success'
json.data do |json|
  json.(current_api_v1_user,
      :name,
      :nickname,
      :image,
      :email,
      :id,
      :gender,
      :date_of_birth,
      :provider,
      :city)
  json.interest_list  current_api_v1_user.interest_list
  json.counts do
    json.followings current_api_v1_user.all_following.count
    json.followers current_api_v1_user.followers.count
    json.my_activities current_api_v1_user.activities.count
  end
end