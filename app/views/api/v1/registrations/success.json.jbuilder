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
      :city)
  json.interest_list  current_api_v1_user.interest_list
end
