require 'rails_helper'

RSpec.describe 'Create Activity', type: :request do

  let(:params) { {omniauth_window_type: 'newWindow'} }
  let(:request) do
    lambda do
      get('/api/v1/auth/facebook/',
          params: params,
          headers: headers)
      follow_redirect! until response.status == 200
    end
  end

  before do
    request.call
  end

  context 'if oauth user is persisted' do
    let(:user) { User.last }
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }
    let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }
    let(:valid_category) { Activity::VALID_CATEGORIES.first }
    it 'the user exists' do
      post '/api/v1/activities',
           params: {
               title: 'An Amazing Time on the Slopes',
               body: 'Wow, I skiied a five diamond or whatever.',
               difficulty: 2,
               category: valid_category
           },
           headers: valid_auth_headers
      expect(response_json['status']).to eq 'success'
      expect(response_json['data']['title'])
          .to eq 'An Amazing Time on the Slopes'
      expect(Activity.last.title).to eq 'An Amazing Time on the Slopes'
      expect(Activity.last.category).to eq valid_category
    end
  end


end