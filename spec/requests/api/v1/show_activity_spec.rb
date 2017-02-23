# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Show Activity', type: :request do

  let!(:activity) { create(:activity, title: 'An Amazing Time on the Slopes') }
  let!(:activity_detail) { create(:activity_detail, activity: activity, attachment_type: "Image" ) }
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:user2) { create(:user, email: 'email@another.com', password: 'password') }
  let!(:comment) { create(:comment, user: user, activity: activity) }

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

  describe 'Comment' do
    it 'returns comments on response' do
      expect(response_json['data']['comments'][0]['activity_id'])
        .to eq activity.id
    end

    it 'includes comment user details' do
      expect(response_json['data']['comments'][0]['user']['image'])
      .to eq user.image
      expect(response_json['data']['comments'][0]['user']['nickname'])
      .to eq user.nickname
      expect(response_json['data']['comments'][0]['user']['name'])
      .to eq user.name
    end

  end

  describe 'Followers' do
    it 'shows a follower count' do
      user.follow user2
      expect(response_json['data']['user']['follower_count']).to eq user.followers.count
    end
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
