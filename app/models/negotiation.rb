# == Schema Information
#
# Table name: negotiations
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  user_id    :integer
#  value      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Negotiation < ActiveRecord::Base
  attr_accessible :user_id, :value
  validates :user_id, presence: true
  validates :client_id, presence: true
  validates :value, presence: true
end
