# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :client_id

  belongs_to :user
  belongs_to :client

  validates :user_id, presence: true
  validates :client_id, presence: true
end
