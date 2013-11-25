class Employee < ActiveRecord::Base
  attr_accessible  :name, :client_id
  validates :client_id, presence: true
  belongs_to :client
end
