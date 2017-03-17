require 'rails_helper'

RSpec.describe "Get a user's activities", type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:activity) { create(:activity, user: user, title: 'A Fun Activity')}
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  before(:each) do
    get "/api/v1/users/#{user.id}/activities", headers: valid_auth_headers
  end

  it 'returns a list of activities that user created' do
    expect(response_json['status']).to eq 'success'
    expect(response_json['data'][0]['title'])
        .to eq 'A Fun Activity'
    expect(response_json['data'][0]['body']).to eq activity.body
    expect(response_json['data'][0]['difficulty']).to eq activity.difficulty
    expect(response_json['data'][0]['category']).to eq activity.category
  end

end
