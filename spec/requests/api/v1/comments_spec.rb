require 'rails_helper'

RSpec.describe 'Comment on Activity', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:activity) { create(:activity, user: user) }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  it 'create comment' do
    post '/api/v1/comments',
      params: {
        body: 'looks like this was fun',
        activity_id: activity.id
    },
    headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['data']['body']).to eq 'looks like this was fun'
    expect(response_json['data']['user']['name']).to eq user.name
    expect(response_json['data']['activity']['title']).to eq activity.title
  end

  it 'returns an error when body is blank' do
    post '/api/v1/comments',
      params: {
        body: ' ',
        activity_id: activity.id
    },
    headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Body can\'t be blank'
  end

  it 'sends error message if there is no user signed in' do
    post '/api/v1/comments',
         params: {
           body: 'Body of comment',
           activity_id: activity.id
         },
         headers: invalid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'User must exist'
  end

  it 'sends error message if there is no activity with given id' do
    post '/api/v1/comments',
         params: {
           body: 'Body of comment',
           activity_id: 'e'
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Activity must exist'
  end
end
