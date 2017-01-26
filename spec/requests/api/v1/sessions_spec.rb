require 'rails_helper'

RSpec.describe 'User Sign in', type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@email.com') }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }

  context 'with valid credentials' do
    it 'returns a user and token' do
      post '/api/v1/auth/sign_in', params: {email: user.email, password: user.password}, headers: headers

      expect(response_json['data']['email']).to eq user.email
      expect(response.status).to eq 200
    end
  end

  context 'with invalid credentials' do
    it 'rejects an email that is not in the system' do
      post '/api/v1/auth/sign_in', params: {email: 'wrong@email.com', password: user.password}, headers: headers

      expect(response_json['errors'][0]).to eq 'Invalid login credentials. Please try again.'
      expect(response.status).to eq 401

    end

    it 'rejects the wrong password' do
      post '/api/v1/auth/sign_in', params: {email: user.email, password: 'wrong_password'}, headers: headers

      expect(response_json['errors'][0]).to eq 'Invalid login credentials. Please try again.'
      expect(response.status).to eq 401

    end

  end
end