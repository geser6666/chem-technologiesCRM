class Client < ActiveRecord::Base
  attr_accessible :address, :country_id, :name
  validates :name, presence: true
  validates :country_id, presence: true
  has_many :employees, foreign_key: "client_id",dependent: :destroy

end
