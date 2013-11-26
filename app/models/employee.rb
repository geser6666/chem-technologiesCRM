class Employee < ActiveRecord::Base
  attr_accessible  :name
  validates :client_id, presence: true
  belongs_to :client
  has_many :contacts, foreign_key: "employee_id", dependent: :destroy
end
