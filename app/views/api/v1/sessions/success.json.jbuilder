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
      :description,
      :city,
      :interest_list)
  json.interest_list current_api_v1_user.interest_list
  json.counts do
    json.followings current_api_v1_user.follow_count
    json.followers current_api_v1_user.followers_count
    json.my_activities current_api_v1_user.activities.count
    json.my_saved_activities current_api_v1_user.my_saved_activities.count
  end
end
