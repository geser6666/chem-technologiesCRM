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
end
