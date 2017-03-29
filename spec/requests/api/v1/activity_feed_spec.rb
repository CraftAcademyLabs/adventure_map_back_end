require 'rails_helper'

RSpec.describe 'View Activity Feed', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:user2) { create(:user, email: 'email@another.com', password: 'password') }
  let!(:activity) { create(:activity, user_id: user.id, title: 'Sailing at Marstrand')}
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:valid_auth_headers) { headers.merge(user2.create_new_auth_token) }
  let(:valid_category) { Activity::VALID_CATEGORIES.first }

  it 'returns a list of activities' do
    get '/api/v1/activities',
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['data'][0]['title']).to eq 'Sailing at Marstrand'
  end

  it 'returns the number of comments' do
    5.times { create(:comment, activity: activity, user: user) }

    get '/api/v1/activities',
         headers: valid_auth_headers
    expect(response_json['data'][0]['comments_count']).to eq 5
  end

  describe 'followers' do
    before :each do
      user2.follow user
      get '/api/v1/activities',
        headers: valid_auth_headers
    end
    it 'returns the number of followers' do
      expect(response_json['data'][0]['user']['followers_count']).to eq user.followers.count
    end

    it 'true if current user is following activity owner' do
      expect(response_json['data'][0]['user']['following']).to be true
    end
  end

  describe 'likes' do
    before :each do
      user2.follow activity
      get '/api/v1/activities',
          headers: valid_auth_headers
    end

    it 'returns true if a user likes an activity' do
      expect(response_json['data'][0]['user']['likes']).to be true
    end
    
    it 'returns the number of likes for an activity' do
      expect(response_json['data'][0]['likes_count']).to eq 1
    end
  end
end
