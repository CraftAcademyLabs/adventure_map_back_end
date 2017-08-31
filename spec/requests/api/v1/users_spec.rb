require 'rails_helper'

RSpec.describe 'GET /api/v1/users/:id', type: :request do
  let!(:user) { create(:user) }
  let!(:viewed_user) { create(:user, name: 'Thomas', nickname: 'Tochman') }
  let!(:activity) { create(:activity, user: viewed_user, title: 'A Fun Activity') }
  let!(:activity2) { create(:activity, user: viewed_user) }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }


  context 'with correct params' do
    before(:each) do
      get "/api/v1/users/#{viewed_user.id}", headers: valid_auth_headers
    end

    it 'should respond with http code 200' do
      expect(response.status).to eq 200
    end

    it 'returns a user resource' do
      expect(response_json['status']).to eq 'success'
      expect(response_json['user']['name'])
          .to eq 'Thomas'
      expect(response_json['user']['nickname']).to eq 'Tochman'
    end

    it 'activities key should contain correct number of objects' do
      expect(response_json['user']['activities'].size).to eq 2
    end
  end


  context 'RecordNotFound' do
    before do
      get '/api/v1/users/555'
    end

    it 'should respond with http code 422' do
      expect(response.status).to eq 422
    end

    it 'should return error message' do
      expected_response = {error: 'Couldn\'t find User with \'id\'=555'}
      expect(response_json).to eq JSON.parse(expected_response.to_json)
    end

  end

end
