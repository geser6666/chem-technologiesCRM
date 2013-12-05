# == Schema Information
#
# Table name: contact_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactType < ActiveRecord::Base
  attr_accessible :name
  has_many :contacts, foreign_key: "contacttype_id"
  validates :name, presence: true
end
