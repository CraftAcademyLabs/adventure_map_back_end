require 'rails_helper'

RSpec.describe 'Following users', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:other_user) { create(:user, email: 'new@email.com', password: 'password') }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }
  let!(:other_user_auth_headers) { headers.merge(other_user.create_new_auth_token) }

  it 'user does not follow another user by default' do
    expect(user.following? other_user).to be false
  end

  it 'user can follow the other user' do
    post "/api/v1/follows/", params: { user_id: other_user.id },
      headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(user.following? other_user).to be true
  end

  it 'user can unfollow another user' do
    user.follow other_user
    delete "/api/v1/follows/#{other_user.id}", headers: valid_auth_headers
    expect(user.following? other_user).to be false
  end

  it 'can view a list of people he follows' do
    user.follow other_user
    get '/api/v1/follows', params: { request: 'followings' },
        headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['users'].first['id']).to eq other_user.id
  end

  it 'can view a list of users following him' do
    user.follow other_user
    get '/api/v1/follows', params: { request: 'followers' },
        headers: other_user_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['users'].first['id']).to eq user.id
  end



end
