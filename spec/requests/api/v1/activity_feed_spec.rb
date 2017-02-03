require 'rails_helper'

RSpec.describe 'View Activity Feed', type: :request do
  let!(:user) { FactoryGirl.create(:user, email: 'email@email.com', password: 'password') }
  let!(:activity) { FactoryGirl.create(:activity, user_id: user.id, title: 'Sailing at Marstrand')}
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  # let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }
  let(:valid_category) { Activity::VALID_CATEGORIES.first }

  it 'returns a list of activities' do
    get '/api/v1/activities',
         # params: {
         #     title: 'An Amazing Time on the Slopes',
         #     body: 'Wow, I skiied a five diamond or whatever.',
         #     difficulty: 2,
         #     category: valid_category
         # },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json[0]['title']).to eq 'Sailing at Marstrand'
  end
end
