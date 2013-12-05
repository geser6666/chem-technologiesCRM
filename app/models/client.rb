# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  country_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ActiveRecord::Base
  attr_accessible :address, :name, :country_id
  belongs_to :country
  has_many :relationships
  has_many :users, through: :relationships

  validates :name, presence: true
  validates :country_id, presence: true
  has_many :employees, foreign_key: "client_id",dependent: :destroy
  has_many :contacts, foreign_key: "client_id",dependent: :destroy

end
