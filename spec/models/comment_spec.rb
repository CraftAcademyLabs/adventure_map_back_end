require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Database schema' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :activity_id }
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:activity) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
