# == Schema Information
#
# Table name: auctions
#
#  id            :bigint(8)        not null, primary key
#  user_id       :bigint(8)
#  close_at      :datetime         not null
#  closed        :boolean          default(FALSE)
#  title         :string(255)      not null
#  description   :text(65535)      not null
#  picture       :string(255)
#  initial_price :integer          default(0)
#  maker_id      :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Auction < ApplicationRecord
  belongs_to :user
  belongs_to :maker
end