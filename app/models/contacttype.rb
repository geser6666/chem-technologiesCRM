class Contacttype < ActiveRecord::Base
  attr_accessible :name
  has_many :contacts, foreign_key: "contacttype_id"
  validates :name, presence: true
end
