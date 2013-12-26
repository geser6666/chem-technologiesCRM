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

require 'spec_helper'

describe Employee do
  
  
  let(:client) { FactoryGirl.create(:client) }
  before { @employee = client.employees.build(name: "Test employee") }


  subject { @employee }

  describe "accessible attributes" do
    it "should not allow access to client_id" do
      expect do
        Employee.new(client_id: client.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  describe  "when name is not present" do
    before { @employee.name = " " }
    it { should_not be_valid }
  end
end
