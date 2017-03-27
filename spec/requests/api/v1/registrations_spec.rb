# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'User Registration', type: :request do
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }

  context 'with valid credentials' do
    it 'returns a user, tokens and interest_list' do
      post '/api/v1/auth', params: {email: 'example@craftacademy.se',
                                    password: 'password',
                                    password_confirmation: 'password',
                                    name: 'Bob',
                                    nickname: 'Bobby',
                                    image: 'image.png'}, headers: headers
      expect(response_json['status']).to eq 'success'
      expect(response.status).to eq 200
    end

    it 'persists a user to the database' do
      request = lambda do
        post '/api/v1/auth', params: {email: 'example@example.se',
                                      password: 'password',
                                      password_confirmation: 'password',
                                      name: 'Bob',
                                      nickname: 'Bobby',
                                      image: 'image.png',
                                      date_of_birth: '1971-01-24',
                                      gender: 'Male',
                                      city: 'Sigtuna'}, headers: headers
      end

      expect { request.call }.to change(User, :count).by(1)
      expect(User.last.name).to eq 'Bob'
      expect(User.last.nickname).to eq 'Bobby'
      expect(User.last.image).to eq 'image.png'
    end
  end

  describe 'returns interest list as response' do
    interest_list = 'Snow mobiling, Mountain biking'

    it 'on failure to create user' do
      post '/api/v1/auth', params: {email: 'example@craftacademy.se',
                                    password: 'password',
                                    password_confirmation: 'wrong_password',
                                    interest_list: interest_list},
           headers: headers
      expect(response_json['data']['interest_list'])
          .to contain_exactly('Snow mobiling', 'Mountain biking')
    end

    it 'on successful user creation ' do
      post '/api/v1/auth', params: {email: 'example@craftacademy.se',
                                    password: 'password',
                                    password_confirmation: 'password',
                                    interest_list: interest_list},
           headers: headers

      expect(response_json['data']['interest_list'])
          .to contain_exactly('Snow mobiling', 'Mountain biking')
    end

  end

  context 'returns an error message when user submits' do
    it 'interest not included in the list' do
      post '/api/v1/auth', params: {email: 'example@craftacademy.se',
                                    password: 'password',
                                    password_confirmation: 'wrong_password',
                                    interest_list: 'wrong_interest'},
           headers: headers
      expect(response_json['errors']['interests'])
          .to include 'wrong_interest is not a valid selection'
    end

    it 'non-matching password confirmation' do
      post '/api/v1/auth', params: {email: 'example@craftacademy.se',
                                    password: 'password',
                                    password_confirmation: 'wrong_password'},
           headers: headers

      expect(response_json['errors']['password_confirmation'])
          .to include 'doesn\'t match Password'
      expect(response.status).to eq 422
    end

    it 'an invalid email address' do
      post '/api/v1/auth', params: {email: 'example@craft',
                                    password: 'password',
                                    password_confirmation: 'password'},
           headers: headers

      expect(response_json['errors']['email']).to eq ['is not an email']
      expect(response.status).to eq 422
    end

    it 'an already registered email' do
      create(:user,
             email: 'example@craftacademy.se',
             password: 'password',
             password_confirmation: 'password')

      post '/api/v1/auth', params: {email: 'example@craftacademy.se',
                                    password: 'password',
                                    password_confirmation: 'password'},
           headers: headers

      expect(response_json['errors']['email']).to eq ['has already been taken']
      expect(response.status).to eq 422
    end
  end

  describe 'OmniAuth' do
    context 'Facebook' do
      let(:params) { {omniauth_window_type: 'newWindow'} }
      let(:request) do
        lambda do
          get('/api/v1/auth/facebook/',
              params: params,
              headers: headers)
          follow_redirect! until response.status == 200
        end
      end

      it 'allows user to register with valid authorization' do
        # Uses default mock, set in support/oauth.rb
        expect { request.call }.to change(User, :count).by(1)
      end

      it 'fails to register user with invalid authorization' do
        OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
        expect { request.call }.to change(User, :count).by(0)
      end
    end
  end
end
