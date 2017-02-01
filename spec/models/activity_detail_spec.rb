require 'rails_helper'

RSpec.describe ActivityDetail, type: :model do
  it 'should have valid Factory ' do
    expect(create(:activity_detail)).to be_valid
  end

  describe 'Database schema' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :activity_id }
    it { is_expected.to have_db_column :file_attachment }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Associations ' do
    it { is_expected.to belong_to(:activity).dependent(:destroy) }
  end
end
