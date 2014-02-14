# encoding: utf-8
require 'spec_helper'

describe Message do
  subject { message }
    
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client) }
  let(:negotiation) { client.negotiations.build(value:'Negotiation 1', user_id: user.id) }

  let(:message) { Message.create(negotiation_id: negotiation.id, user_id:user.id) }

  # describe "доступ к атрибутам" do
  # 	it "не должно давать доспуп к user_id" do
  # 		expect do
  # 			Relationship.new(user_id: user.id)
  # 		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  # 	end
  # end

 it { should respond_to(:user_id) } 
 it { should respond_to(:negotiation_id) }

  # its(:user) { should == user }
  # its(:client) { should == client }

  describe "при отсутствующем user_id" do
  	before { message.user_id = nil }
  	it { should_not be_valid }
  end

  describe "при отсутствующем client_id" do
  	before { message.negotiation_id = nil }
  	it { should_not be_valid }
  end

end
