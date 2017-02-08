require 'rails_helper'

RSpec.describe 'Following users', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:other_user) { create(:user, email: 'new@email.com', password: 'password') }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  it 'user does not follow another user by default' do
    expect(user.following? other_user).to be false
  end

  it 'user can follow the other user' do
    post "/api/v1/follows/", params: { user_id: other_user.id },
      headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(user.following? other_user).to be true
  end

end
