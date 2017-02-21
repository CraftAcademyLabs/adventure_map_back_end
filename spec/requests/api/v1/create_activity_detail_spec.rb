require 'rails_helper'

RSpec.shared_examples 'activity detail' do | detail_type |
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:activity) { create(:activity, user: user)}
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  it "generates an upload URL and accepts an #{detail_type}" do
      post "/api/v1/activities/#{activity.id}/activity_details",
      params: {
        file_attachment: 'https://valid.url.com',
        attachment_type: "#{detail_type}"
      },
      headers: valid_auth_headers
      expect(ActivityDetail.last.activity_id).to eq activity.id
      expect(response_json['status']).to eq 'success'
      expect(response_json['data']['file_attachment'])
        .to eq 'https://valid.url.com'
      expect(response_json['data']['activity']['id'])
      .to eq activity.id
  end

    it 'returns an error without file attachment' do
      post "/api/v1/activities/#{activity.id}/activity_details",
      params: {
        attachment_type: "#{detail_type}"
      },
      headers: valid_auth_headers

      expect(response_json['message'][0]).to eq 'File attachment can\'t be blank'
    end

    it 'returns an error without attachment_type ' do
      post "/api/v1/activities/#{activity.id}/activity_details",
      params: {
        file_attachment: 'https://valid.url.com',
      },
      headers: valid_auth_headers

      expect(response_json['message'][0]).to eq 'Attachment type can\'t be blank'
    end
end

RSpec.describe 'Create Activity Detail', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:activity) { create(:activity, user: user)}
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  describe 'Create an Image' do
    it_behaves_like 'activity detail', 'Image'
  end

  describe 'Create an Route' do
    it_behaves_like 'activity detail', 'Route'
  end

  describe 'Create an Waypoint' do
    it_behaves_like 'activity detail', 'Waypoint'
  end
end
