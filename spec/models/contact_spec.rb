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

require 'spec_helper'

describe Contact do

#let(:followed) { FactoryGirl.create(:user) }
#  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  let(:client) { FactoryGirl.create(:client) }
  let(:client2) { FactoryGirl.create(:client) }
  let(:contacttype) { ContactType.new(name: "Test ContactType")}
  let (:employee) {client.employees.build(name: "Test employee")}
  let (:employee2) {client2.employees.build(name: "Test employee")}

  it { contacttype.should be_valid }

  
  before do
    contacttype.save
    @contact=client.contacts.build(contacttype_id: contacttype.id, value: "Test contact")
    @contact_with_employee=client.contacts.build(contacttype_id: contacttype.id, employee_id: employee.id,
         value: "Test contact")
  end

  it { @contact_with_employee.should be_valid }

  subject { @contact }

  it { should respond_to(:client_id) }
  it { should respond_to(:contacttype_id) }
  it { should respond_to(:employee_id) }
  it { should respond_to(:value) }


   #@contact.should be_valid  
  it { should be_valid }  



  describe "accessible attributes" do
    it "should not allow access to client_id" do
      expect do
        Employee.new(client_id: client.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
    it "should not allow access to employee_id" do
      expect do
        Employee.new(employee_id: employee.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end


  describe  "when client_id is not present" do
    before { @contact.client_id = nil }
    it { should_not be_valid }
  end
  describe  "when contacttype_id is not present" do
    before { @contact.contacttype_id = nil }
    it { should_not be_valid }
  end
  describe  "when value is not present" do
    before { @contact.value = " " }
    it { should_not be_valid }
  end
  describe "when employee_id not empty " do
    describe "mast employee_client_id equal contact_client_id" do
      it "xxxx" do
        @contact_with_employee.client.id.should == employee.client.id
      end
      
      it { should be_valid }
    end
    describe "mast employee_client_id not equal contact_client_id" do
      it "YYYY" do
        @contact_with_employee.client.id.should_not == employee2.client.id
      end
    
      it { should be_valid }
    end

  end



end
