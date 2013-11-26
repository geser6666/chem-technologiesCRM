class Contact < ActiveRecord::Base
  attr_accessible :client_id, :contactcype_id, :employee_id, :value

  belongs_to :client
  belongs_to :employee
  belongs_to :contacttype
end
