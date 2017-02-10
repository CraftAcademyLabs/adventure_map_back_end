require 'rails_helper'

RSpec.describe 'Comment on Activity', type: :request do
  let!(:user) { create(:user, email: 'email@email.com', password: 'password') }
  let!(:second_user) { create(:user) }
  let!(:activity) { create(:activity, user: user) }
  let!(:comment) { create(:comment, user: user, activity: activity) }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let!(:invalid_auth_headers) { headers }
  let!(:valid_auth_headers) { headers.merge(user.create_new_auth_token) }
  let!(:second_user_headers) { headers.merge(second_user.create_new_auth_token) }

  it 'create comment' do
    post "/api/v1/activities/#{activity.id}/comments/",
      params: {
        body: 'looks like this was fun',
    },
    headers: valid_auth_headers

    expect(response_json['status']).to eq 'success'
    expect(response_json['data']['body']).to eq 'looks like this was fun'
    expect(response_json['data']['user']['name']).to eq user.name
    expect(response_json['data']['activity']['title']).to eq activity.title
  end

  it 'returns an error when body is blank' do
    post "/api/v1/activities/#{activity.id}/comments/",
      params: {
        body: ' ',
    },
    headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Body can\'t be blank'
  end

  it 'sends error message if there is no user signed in' do
    post "/api/v1/activities/#{activity.id}/comments/",
         params: {
           body: 'Body of comment',
         },
         headers: invalid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'User must exist'
  end

  it 'sends error message if there is no activity with given id' do
    post "/api/v1/activities/r/comments/",
         params: {
           body: 'Body of comment',
         },
         headers: valid_auth_headers

    expect(response_json['status']).to eq 'error'
    expect(response_json['message'][0]).to eq 'Activity must exist'
  end

  it 'can delete comment' do
    delete "/api/v1/activities/#{activity.id}/comments/#{comment.id}",
      headers: valid_auth_headers
    expect(response_json['status']).to eq 'success'
    expect(Comment.find_by_id(comment.id)).to be_nil
  end

  it 'cannot delete other users comment' do
    delete "/api/v1/activities/#{activity.id}/comments/#{comment.id}",
      headers: second_user_headers
    expect(response_json['status']).to eq 'error'
    expect(response_json['message'])
    .to eq 'You are not allowed to perform this action'
    expect(Comment.find_by_id(comment.id)).not_to be_nil
  end

  describe 'edit comment' do
    it 'user can edit own comment' do
      put "/api/v1/activities/#{activity.id}/comments/#{comment.id}",
      params: {
        body: 'New comment body'
      },
        headers: valid_auth_headers
        expect(response_json['status']).to eq 'success'
        expect(response_json['data']['body']).to eq 'New comment body'
        comment.reload
        expect(comment.body).to eq 'New comment body'
    end

    it 'user cannot edit other user comment' do
      put "/api/v1/activities/#{activity.id}/comments/#{comment.id}",
      params: {
        body: 'New comment body'
      },
      headers: second_user_headers
        expect(response_json['status']).to eq 'error'
        expect(response_json['message'])
        .to eq "You are not allowed to perform this action"
        comment.reload
        expect(comment.body).not_to eq 'New comment body'
    end
  end
end
