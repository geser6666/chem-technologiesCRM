class Client < ActiveRecord::Base
  attr_accessible :address, :country_id, :name
  belongs_to :country

  validates :name, presence: true
  validates :country_id, presence: true
end
