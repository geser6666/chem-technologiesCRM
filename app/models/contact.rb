class Contact < ActiveRecord::Base
  attr_accessible  :contacttype_id, :employee_id, :value

  validates :client_id, presence: true
  validates :contacttype_id, presence: true
  validates :value, presence: true

  belongs_to :client
  belongs_to :employee
  belongs_to :contacttype
end
