require 'rails_helper'

RSpec.describe Activity, type: :model do
  it 'should have valid Factory' do
    expect(create(:activity)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :category }
    it { is_expected.to have_db_column :difficulty }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:difficulty) }

    it { is_expected.to validate_inclusion_of(:difficulty).in_array([1, 2, 3]) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
end
