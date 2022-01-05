require 'rails_helper'

RSpec.describe Favourite, type: :model do
  it 'should belong to a User' do
    favourite = Favourite.reflect_on_association(:user).macro
    expect(favourite).to eq(:belongs_to)
  end

  it 'should belong to a Hotel' do
    favourite = Favourite.reflect_on_association(:house).macro
    expect(favourite).to eq(:belongs_to)
  end
end
