# == Schema Information
#
# Table name: contacts
#
#  id             :integer          not null, primary key
#  client_id      :integer
#  contacttype_id :integer
#  value          :string(255)
#  employee_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Contact < ActiveRecord::Base
  attr_accessible  :contacttype_id, :employee_id, :value

  validates :client_id, presence: true
  validates :contacttype_id, presence: true
  validates :value, presence: true

  belongs_to :client
  belongs_to :employee
  belongs_to :contacttype
end
