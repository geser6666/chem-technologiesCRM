class Message < ActiveRecord::Base
  attr_accessible :negotiation_id, :user_id

  has_many :negotiations
  has_many :users
  
  validates :user_id, presence: true
  validates :negotiation_id, presence: true
end
