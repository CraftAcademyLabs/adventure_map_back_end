require 'rails_helper'

RSpec.describe ApplicationPolicy do

  let(:admin) { create(:admin_user) }
  let(:resource) { create(:admin_user, email: 'another_admin@admin.com') }

  describe 'For Admin' do
    subject { described_class.new(admin, resource) }

    %w(index show update destroy create).each do |action|
      it { is_expected.to permit_action action.to_sym }
    end
  end

  describe 'For non Admin' do
    subject { described_class.new(nil, resource) }

    %w(index show update destroy create).each do |action|
      it { is_expected.to forbid_action action.to_sym }
    end
  end
end