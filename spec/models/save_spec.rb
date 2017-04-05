require 'rails_helper'

RSpec.describe Save, type: :model do
  describe 'DB table & validations' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :activity }
  end
end
