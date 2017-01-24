RSpec.describe UserPolicy do

  let(:admin) { create(:admin_user) }
  let(:resource) { create(:user, email: 'another_admin@admin.com') }

  describe 'For Admin' do
    subject { described_class.new(admin, resource) }

    it { is_expected.to forbid_action :destroy }

    %w(index show update create).each do |action|
      it { is_expected.to permit_action action.to_sym }
    end


    describe 'For non Admin' do
      subject { described_class.new(nil, resource) }

      %w(index show update destroy create).each do |action|
        it { is_expected.to forbid_action action.to_sym }
      end
    end
  end
end