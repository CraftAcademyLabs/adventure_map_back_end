require 'rails_helper'

RSpec.describe 'Create Activity', type: :request do
  let!(:user) { FactoryGirl.create(:user, email: 'email@email.com', password: 'password') }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }
  let(:valid_category) { Activity::VALID_CATEGORIES.first }

  it 'creates a new Activity associated with a User' do
    post '/api/v1/activities',
         params: {
             title: 'An Amazing Time on the Slopes',
             body: 'Wow, I skiied a five diamond or whatever.',
             difficulty: 2,
             category: valid_category
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['activity']['title']).to eq 'An Amazing Time on the Slopes'
    expect(Activity.last.title).to eq 'An Amazing Time on the Slopes'
    expect(Activity.last.category).to eq valid_category
  end

  it 'sends error message if there is no title' do
    post '/api/v1/activities',
         params: {
             body: 'Wow, I skiied a five diamond or whatever.',
             difficulty: 2,
             category: valid_category
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Title can\'t be blank'
  end

  it 'sends error message if the category is not whitelisted' do
    post '/api/v1/activities',
         params: {
             body: 'Wow, I skiied a five diamond or whatever.',
             title: 'Nice title',
             difficulty: 2,
             category: 'Invalid Category'
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Category is invalid'
  end

  it 'sends error message if there is no body' do
    post '/api/v1/activities',
         params: {
             title: 'An Amazing Time on the Slopes',
             difficulty: 2,
             category: valid_category
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Body can\'t be blank'
  end

  it 'sends error message if there is no user signed in' do
    post '/api/v1/activities',
         params: {
             title: 'An Amazing Time on the Slopes',
             body: 'Wow, I skiied a five diamond or whatever.',
             difficulty: 2,
             category: valid_category
         },
         headers: invalid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message']).to eq ['User must exist']
  end
end
