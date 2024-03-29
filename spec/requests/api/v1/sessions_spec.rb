require 'rails_helper'

RSpec.describe 'User Sign in', type: :request do
  let(:user) { create(:user, email: 'email@email.com') }
  let(:user2) { create(:user, email: 'email@random.com') }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }

  context 'with valid credentials' do
    before do

    end

    it 'returns a user and token' do
      post '/api/v1/auth/sign_in', params: {email: user.email,
                                            password: user.password}, headers: headers
      expect(response_json['data']['email']).to eq user.email
      expect(response.headers['access-token']).not_to be nil
      expect(response.status).to eq 200
      expect(response_json['data']['name']).to eq user.name
    end

    it 'provides counts for profile page' do
      post '/api/v1/auth/sign_in', params: {email: user.email,
                                            password: user.password}, headers: headers
      user.follow user2
      user.activities.create(title: 'Title', body: 'Body', category: 'Hiking', difficulty: 1)
      post '/api/v1/auth/sign_in', params: {email: user.email,
                                            password: user.password}, headers: headers

      expect(response_json['data']['counts']['followers']).to eq 0
      expect(response_json['data']['counts']['followings']).to eq 1
      expect(response_json['data']['counts']['my_activities']).to eq 1
      # Need to include saved activities when available
    end
  end

  context 'with invalid credentials' do
    it 'rejects an email that is not in the system' do
      post '/api/v1/auth/sign_in', params: {email: 'wrong@email.com',
                                            password: user.password}, headers: headers

      expect(response_json['errors'][0]).to eq 'Invalid login credentials. Please try again.'
      expect(response.status).to eq 401

    end

    it 'rejects the wrong password' do
      post '/api/v1/auth/sign_in', params: {email: user.email,
                                            password: 'wrong_password'}, headers: headers

      expect(response_json['errors'][0]).to eq 'Invalid login credentials. Please try again.'
      expect(response.status).to eq 401

    end

  end
end