require 'rails_helper'
RSpec.describe InterestParser do
  let(:user) {create(:user)}
  it 'raises an error with invalid interest' do
    expect {
      user.interest_list.add('wrong interest', parser: InterestParser)
    }.to raise_error 'You need to pick one of the preset interests'
  end
end
