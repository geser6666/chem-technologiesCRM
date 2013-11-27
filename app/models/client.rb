class Client < ActiveRecord::Base
  attr_accessible :address, :name, :country_id
  validates :name, presence: true
  validates :country_id, presence: true
  has_many :employees, foreign_key: "client_id",dependent: :destroy
  has_many :contacts, foreign_key: "client_id",dependent: :destroy

end
