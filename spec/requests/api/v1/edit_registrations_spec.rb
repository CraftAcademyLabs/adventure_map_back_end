require 'rails_helper'

RSpec.describe 'Edit User Registration', type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@email.com', image: 'image.png') }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }

  context 'with valid credentials' do
    it 'returns a user with updates' do
      get '/api/v1/auth/edit', params: {email: user.email,
                                    password: user.password,
                                    # password_confirmation: 'password',
                                    name: user.name,
                                    nickname: user.nickname,
                                    image: 'a_new_image.png'
      }, headers: headers
      expect(response_json['status']).to eq 'success'
      expect(User.last.image).to eq 'a_new_image.png'
    end
  end

  context 'with invalid credentials' do
    it 'rejects an email that is not in the system' do

    end

    it 'rejects the wrong password' do

    end

  end
end