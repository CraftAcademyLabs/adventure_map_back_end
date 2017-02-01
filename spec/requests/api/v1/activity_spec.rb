require 'rails_helper'

RSpec.describe 'Edit User Registration', type: :request do
  let!(:user) { FactoryGirl.create(:user, email: 'email@email.com', password: 'password') }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  it 'creates a new Activity associated with a User' do
    post '/api/v1/activity',
         params: {
             title: 'An Amazing Time on the Slopes',
             body: 'Wow, I skiied a five diamond or whatever.',
             difficulty: 2,
             category: 'Skiing'
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['activity']['title']).to eq 'An Amazing Time on the Slopes'
    expect(Activity.last.title).to eq 'An Amazing Time on the Slopes'
    expect(Activity.last.category).to eq 'Skiing'
  end

  it 'sends error message if there is no title' do
    post '/api/v1/activity',
         params: {
             body: 'Wow, I skiied a five diamond or whatever.',
             difficulty: 2,
             category: 'Skiing'
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Title can\'t be blank'
  end

  it 'sends error message if there is no body' do
    post '/api/v1/activity',
         params: {
             title: 'An Amazing Time on the Slopes',
             difficulty: 2,
             category: 'Skiing'
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Body can\'t be blank'
  end

  it 'sends error message if there is no user signed in' do
    post '/api/v1/activity',
         params: {
             title: 'An Amazing Time on the Slopes',
             body: 'Wow, I skiied a five diamond or whatever.',
             difficulty: 2,
             category: 'Skiing'
         },
         headers: invalid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message']).to eq ['User must exist']
  end
end