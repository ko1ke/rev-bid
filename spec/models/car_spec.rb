# == Schema Information
#
# Table name: cars
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  maker_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Car, type: :model do
  it 'should build factory' do
    expect(FactoryBot.build(:car)).to be_valid
  end
end
