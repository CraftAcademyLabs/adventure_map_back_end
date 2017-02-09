require 'rails_helper'

RSpec.describe 'View Activity Feed', type: :request do
  let!(:user) { FactoryGirl.create(:user, email: 'email@email.com', password: 'password') }
  let!(:activity) { FactoryGirl.create(:activity, user_id: user.id, title: 'Sailing at Marstrand')}
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }
  let(:valid_category) { Activity::VALID_CATEGORIES.first }

  it 'returns a list of activities' do
    get '/api/v1/activities',
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['data'][0]['title']).to eq 'Sailing at Marstrand'
  end
end
