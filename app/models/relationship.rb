class Relationship < ActiveRecord::Base
  attr_accessible :client_id

  belongs_to :user
  belongs_to :client

  validates :user_id, presence: true
  validates :client_id, presence: true
end
