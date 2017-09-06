RSpec.describe Admin::UserPolicy do

  let(:admin) { create(:user, administrator: true) }
  let(:non_admin) { create(:user, administrator: false) }
  let(:resource) { create(:user, email: 'another_admin@admin.com') }

  describe 'For Admin' do
    subject { described_class.new(admin, resource) }

    %w(index show update create destroy).each do |action|
      it { is_expected.to permit_action action.to_sym }
    end


    describe 'For non Admin' do
      subject { described_class.new(non_admin, resource) }

      %w(index show update destroy create).each do |action|
        it { is_expected.to forbid_action action.to_sym }
      end
    end
  end
end