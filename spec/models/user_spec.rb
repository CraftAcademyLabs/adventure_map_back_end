require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(FactoryGirl.create(:user)).to be_valid
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
    it { is_expected.to have_many(:activities).dependent(:destroy)}
    it { is_expected.to have_many(:comments).dependent(:destroy)}
  end

  describe 'Interests' do
    it 'should have predefined list of interests' do
      expect(User::VALID_INTERESTS).not_to be_empty
    end
  end
end
