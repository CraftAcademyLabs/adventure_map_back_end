require 'rails_helper'

RSpec.describe 'Saving activities', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:other_user) { create(:user, email: 'new@email.com', password: 'password') }
  let!(:user_activity) { create(:activity, user: user)}
  let!(:other_user_activity) { create(:activity, user: other_user)}
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  it 'user does not save an activity by default' do
    expect(user.saved_for? other_user_activity).to be false
  end

  it 'user can save an activity' do
    post "/api/v1/saves", params: { activity_id: other_user_activity.id },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(user.saved_for? other_user_activity).to be true
  end

  it 'user can unsave an activity' do
    other_user_activity.save_by(saver: user)
    delete "/api/v1/saves/#{other_user_activity.id}", headers: valid_auth_headers
    expect(user.saved_for? other_user_activity).to be false
  end

  it 'can return a list of activities the user has saved' do
    other_user_activity.save_by(saver: user)
    get '/api/v1/saves', headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['data'].count).to eq 1
    expect(response_json['data'][0]['title']).to eq other_user_activity.title
  end

end