require 'rails_helper'

RSpec.describe 'Create Activity Detail', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:activity) { create(:activity, user: user)}
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }

  describe 'Create an Image' do
    it 'generates an upload URL and accepts an image' do
      post "/api/v1/activities/#{activity.id}/activity_details",
      params: {
        file_attachment: 'https://valid.url.com',
        attachment_type: 'Image'
      },
      headers: valid_auth_headers

      expect(ActivityDetail.last.activity_id).to eq activity.id

    end

  end

  describe 'Create an Route' do

  end

  describe 'Create an Waypoint' do

  end
end
