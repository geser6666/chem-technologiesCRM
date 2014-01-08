# encoding: utf-8
# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Relationship do
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client) }

  let(:relationship) { user.relationships.build(client_id: client.id) }

  subject { relationship }

  describe "доступ к атрибутам" do
  	it "не должно давать доспуп к user_id" do
  		expect do
  			Relationship.new(user_id: user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  it { should respond_to(:user) } 
  it { should respond_to(:client) }
  its(:user) { should == user }
  its(:client) { should == client }

  describe "при отсутствующем user_id" do
  	before { relationship.user_id = nil }
  	it { should_not be_valid }
  end

  describe "при отсутствующем client_id" do
  	before { relationship.client_id = nil }
  	it { should_not be_valid }
  end
end
