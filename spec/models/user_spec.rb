require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(create(:user)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :provider }
    it { is_expected.to have_db_column :uid }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :reset_password_token }
    it { is_expected.to have_db_column :reset_password_sent_at }
    it { is_expected.to have_db_column :remember_created_at }
    it { is_expected.to have_db_column :sign_in_count }
    it { is_expected.to have_db_column :current_sign_in_at }
    it { is_expected.to have_db_column :last_sign_in_at }
    it { is_expected.to have_db_column :current_sign_in_ip }
    it { is_expected.to have_db_column :last_sign_in_ip }
    it { is_expected.to have_db_column :confirmation_token }
    it { is_expected.to have_db_column :confirmed_at }
    it { is_expected.to have_db_column :confirmation_sent_at }
    it { is_expected.to have_db_column :unconfirmed_email }
    it { is_expected.to have_db_column :nickname }
    it { is_expected.to have_db_column :image }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :date_of_birth }
    it { is_expected.to have_db_column :gender }
    it { is_expected.to have_db_column :city }
    it { is_expected.to have_db_column :description }

    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :administrator }

  end

  describe '#full_name' do
    subject { create(:user) }
    it 'returns a combination of first_name and last_name' do
      expect(subject.full_name).to eq 'Email Emailsson'
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_confirmation_of(:password) }

    context 'should not have an invalid email address' do
      emails = ['asdf@ ds.com', '@example.com', 'test me @yahoo.com', 'asdf@example', 'ddd@.d. .d', 'ddd@.d']
      emails.each do |email|
        it { is_expected.not_to allow_value(email).for(:email) }
      end
    end

    context 'should have a valid email address' do
      emails = %w(asdf@ds.com hello@example.uk test1234@yahoo.si asdf@example.eu)
      emails.each do |email|
        it { is_expected.to allow_value(email).for(:email) }
      end
    end

    it { is_expected.to validate_inclusion_of(:gender).in_array(%w(Male Female Other)) }

    context 'should validate interest is included in list of interests' do
      let(:user) { create(:user) }

      it 'raising error on interest not included in list' do
        user.interest_list.add('not-whitelisted')
        expect(user.valid?).to eq false
      end
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:activities).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:saved_activities).dependent(:destroy) }

  end

  describe 'Interests' do
    it 'should have predefined list of interests' do
      expect(User::VALID_INTERESTS).not_to be_empty
    end
  end

  describe 'Following and Likes' do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:activity) { create(:activity, user: user) }
    let!(:activity2) { create(:activity, user: user2) }

    it 'should be able to follow another user' do
      user.follow user2
      expect(user.following?(user2)).to eq true
      expect(user2.followings.count).to eq 1
    end

    it 'should be able to unfollow another user' do
      user.follow user2
      expect(user.following?(user2)).to eq true
      user.stop_following user2
      expect(user.following?(user2)).to eq false
    end

    it 'should be able to like an activity' do
      user.follow activity2
      expect(user.following?(activity2)).to eq true
      expect(activity2.followings.count).to eq 1
    end

    it 'should be able to unlike an activity' do
      user.follow activity2
      expect(user.following?(activity2)).to eq true
      user.stop_following activity2
      expect(user.following?(activity2)).to eq false
    end
  end
end
