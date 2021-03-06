# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  tel                    :string(255)      not null
#  name                   :string(255)      not null
#  avatar                 :string(255)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Creation" do

    it 'should have tel' do
      expect(FactoryBot.build(:user, :no_tel)).not_to be_valid
    end

    it 'tel should be numbers string' do
      n = rand(1..11)
      random_num = format("%0#{n}d", SecureRandom.random_number(10**n))
      user = (FactoryBot.build(:user))
      user.tel = random_num
      expect(user).to be_valid
    end
  end
end
