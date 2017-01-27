require 'rails_helper'

RSpec.describe 'Edit User Registration', type: :request do
  let!(:user) { FactoryGirl.create(:user, email: 'email@email.com', password: 'password') }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  context 'with valid headers' do
    it 'returns a user with updates' do
      put '/api/v1/auth',
          params: {
              name: 'Another Name',
              image: 'a_new_image.png'
          },
          headers: valid_auth_headers

      expect(response_json['status']).to eq 'success'
      expect(response_json['data']['name']).to eq 'Another Name'
      expect(response_json['data']['image']).to eq 'a_new_image.png'
      expect(User.last.name).to eq 'Another Name'
      expect(User.last.image).to eq 'a_new_image.png'
    end
  end

  context 'with invalid headers' do
    it 'rejects an email that is not in the system' do
      put '/api/v1/auth',
          params: {
              name: 'Another Name',
              image: 'a_new_image.png'
          },
          headers: invalid_auth_headers
      expect(response_json['status']).to eq 'error'
      expect(response_json['errors']).to eq ['User not found.']
    end
  end

end