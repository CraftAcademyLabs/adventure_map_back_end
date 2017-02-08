# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Show Activity', type: :request do

  let!(:activity) { create(:activity, title: 'An Amazing Time on the Slopes') }
  let! ( :activity_detail ) { create(:activity_detail, activity: activity) }

  before(:each) do
    get "/api/v1/activities/#{activity.id}"
  end

  it 'Gets the correct activity' do
    expect(response_json['status']).to eq 'success'
    expect(response_json['activity']['title'])
      .to eq 'An Amazing Time on the Slopes'
    expect(response_json['activity']['body']).to eq activity.body
    expect(response_json['activity']['difficulty']).to eq activity.difficulty
    expect(response_json['activity']['category']).to eq activity.category
  end

  it 'includes user in response' do
    expect(response_json['activity']['user']['name']).to eq activity.user.name
  end

  it 'includes Activity details in response' do
    binding.pry
    expect(response_json['activity']['activityDetails'][0]['activity_id'])
    .to eq activity.id
  end
end
