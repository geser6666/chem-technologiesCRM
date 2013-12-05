# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :clients
end
