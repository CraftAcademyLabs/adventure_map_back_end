json.status 'success'
json.data do |json|
  json.(@resource, :name, :nickname, :image, :email, :id, :gender,
        :date_of_birth, :provider, :city)
  json.interest_list  @resource.interest_list
end
