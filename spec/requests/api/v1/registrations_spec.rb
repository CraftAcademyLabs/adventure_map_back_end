require 'rails_helper'

RSpec.describe 'User Registration', type: :request do
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }

  context 'with valid credentials' do
    it 'returns a user and token' do
      post '/api/v1/auth', params: {email: 'example@craftacademy.se',
                                    password: 'password',
                                    password_confirmation: 'password',
                                    name: 'Bob',
                                    nickname: 'Bobby',
                                    image: 'image.png'
      }, headers: headers
      expect(response_json['status']).to eq 'success'
      expect(response.status).to eq 200
    end

    it 'persists a user to the database' do
      post '/api/v1/auth', params: {email: 'example@example.se',
                                    password: 'password',
                                    password_confirmation: 'password',
                                    name: 'Bob',
                                    nickname: 'Bobby',
                                    image: 'image.png',
                                    date_of_birth: '1971-01-24',
                                    gender: 'Male',
                                    city: 'Sigtuna'

      }, headers: headers

      expect(User.last.name).to eq 'Bob'
      expect(User.last.nickname).to eq 'Bobby'
      expect(User.last.image).to eq 'image.png'
    end
  end

  context 'returns an error message when user submits' do
    it 'non-matching password confirmation' do
      post '/api/v1/auth', params: {email: 'example@craftacademy.se',
                                    password: 'password',
                                    password_confirmation: 'wrong_password'
      }, headers: headers

      expect(response_json['errors']['password_confirmation'])
          .to include 'doesn\'t match Password'
      expect(response.status).to eq 422
    end

    it 'an invalid email address' do
      post '/api/v1/auth', params: {email: 'example@craft',
                                    password: 'password',
                                    password_confirmation: 'password'
      }, headers: headers

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
                                    password_confirmation: 'password'
      }, headers: headers

      expect(response_json['errors']['email']).to eq ['has already been taken']
      expect(response.status).to eq 422
    end
  end

  describe 'OmniAuth' do
    context 'Facebook' do
      before do
        OmniAuth.config.test_mode = true
        @redirect_url = "http://ng-token-auth.dev/"
        OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(:provider => "facebook", :uid => "123545", :info => ({:name => "chong", :email => "chongbong@aol.com"}))
      end


      it 'allows user to register with valid authorization' do
        #binding.pry
        # post '/omniauth/facebook/callback', params: {
        #     auth_origin_url: 'http://craftacademy.se',
        #     favorite_color: 'grey',
        #     omniauth_window_type: 'newWindow'
        # }, headers: headers

        get('/api/v1/auth/facebook/', params: {}, headers: headers)
        follow_redirect! until response.status == 200
        expect(response_json['message']).to eq('success')
        expect(response_json['user']['name']).to eq('Thomas Ochman')
        expect(response_json['user']['token']).to_not be nil
        expect(response.status).to eq 200
      end

      it 'fails to register user with invalid authorization' do
        OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
        post '/omniauth/facebook/callback', params: nil, headers: headers
        expect(response_json['errors']).to eq('authentication error')
        expect(response.status).to eq 401
      end
    end
  end

end