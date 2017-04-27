require 'rails_helper'

RSpec.describe 'Liking activities', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:other_user) { create(:user, email: 'new@email.com', password: 'password') }
  let!(:user_activity) { create(:activity, user: user) }
  let!(:other_user_activity) { create(:activity, user: other_user) }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  it 'user does not like an activity by default' do
    expect(user.following? other_user_activity).to be false
  end

  it 'user can like an activity' do
    post '/api/v1/likes/', params: {activity_id: other_user_activity.id, },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(user.following? other_user_activity).to be true
  end

  it 'user can unlike an activity' do
    user.follow other_user_activity
    delete "/api/v1/likes/#{other_user_activity.id}", headers: valid_auth_headers
    expect(user.following? other_user_activity).to be false
  end

end