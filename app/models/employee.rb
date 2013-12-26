# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ActiveRecord::Base
  attr_accessible  :name
  validates :client_id, presence: true
  validates :name, presence: true
  belongs_to :client
  has_many :contacts, foreign_key: "employee_id", dependent: :destroy
end
