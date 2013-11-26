# encoding: utf-8
require 'spec_helper'

describe Relationship do
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client) }

  let(:relationship) { user.relationships.build(client_id: client.id) }

  subject { relationship }

  describe "accessible attributes" do
  	it "не должно давать доспуп к user_id" do
  		expect do
  			Relationship.new(user_id: user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end
end
