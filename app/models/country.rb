class Country < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :clients
  validates  :code, presence: true
  validates  :name, presence: true
end
