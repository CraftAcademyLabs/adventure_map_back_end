# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Show Activity', type: :request do
  let!(:activity) do
    FactoryGirl.create(:activity, title: 'An Amazing Time on the Slopes')
  end

  it 'Gets the correct activity' do
    get "/api/v1/activities/#{activity.id}"
    expect(response_json['status']).to eq 'success'
    expect(response_json['activity']['title'])
      .to eq 'An Amazing Time on the Slopes'
    expect(response_json['activity']['body']).to eq activity.body
    expect(response_json['activity']['difficulty']).to eq activity.difficulty
    expect(response_json['activity']['category']).to eq activity.category
  end
end
