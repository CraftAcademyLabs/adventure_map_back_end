# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Show Activity', type: :request do

  let!(:activity) { create(:activity, title: 'An Amazing Time on the Slopes') }
  let!(:activity_detail) { create(:activity_detail, activity: activity, attachment_type: "Image" ) }

  before(:each) do
    get "/api/v1/activities/#{activity.id}"
  end

  it 'Gets the correct activity' do
    expect(response_json['status']).to eq 'success'
    expect(response_json['data']['title'])
        .to eq 'An Amazing Time on the Slopes'
    expect(response_json['data']['body']).to eq activity.body
    expect(response_json['data']['difficulty']).to eq activity.difficulty
    expect(response_json['data']['category']).to eq activity.category
  end

  it 'includes user in response' do
    expect(response_json['data']['user']['name']).to eq activity.user.name
  end

  describe 'Images' do

    it 'included in response' do
      get "/api/v1/activities/#{activity.id}"
      expect(response_json['data']["images"][0]['activity_id'])
      .to eq activity.id
    end

    it 'not include in response if none exist' do
      activity_detail.update_attribute(:attachment_type, "Waypoint")
      get "/api/v1/activities/#{activity.id}"
      expect(response_json['data']['images'][0]).to be_nil
    end
  end

  describe 'WayPoints' do
    it 'included in response' do
      activity_detail.update_attribute(:attachment_type, "Waypoint")
      get "/api/v1/activities/#{activity.id}"
      expect(response_json['data']["waypoints"][0]['activity_id'])
      .to eq activity.id
    end

    it 'not included in response if none exists' do
      get "/api/v1/activities/#{activity.id}"
      expect(response_json['data']['waypoints'][0]).to be_nil
    end
  end

  describe 'Routes' do
    it 'included in response' do
      activity_detail.update_attribute(:attachment_type, "Route")
      get "/api/v1/activities/#{activity.id}"
      expect(response_json['data']["routes"][0]['activity_id'])
      .to eq activity.id
    end

    it 'not included in response if none exists' do
      get "/api/v1/activities/#{activity.id}"
      expect(response_json['data']['routes'][0]).to be_nil
    end
  end
end
