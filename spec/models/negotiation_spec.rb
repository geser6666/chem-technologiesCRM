# == Schema Information
#
# Table name: negotiations
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  user_id    :integer
#  value      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Negotiation do
 
 let(:user) { FactoryGirl.create(:user) }
 let(:client) {FactoryGirl.create(:client) }
 let(:negotiation) { FactoryGirl.create(:negotiation, client_id: client.id, user_id: user.id) }
  subject { negotiation }

 it { should respond_to(:value) }
 it { should respond_to(:user_id) }

 describe 'when client_id is not present' do
    before { negotiation.client_id = nil }
    it { should_not be_valid }
  end
 describe 'when user_id is not present' do
    before { negotiation.user_id = nil }
    it { should_not be_valid }
  end
  describe "accessible attributes" do
    it "should not allow access to client_id" do
      expect do
        Negotiation.new(client_id: client.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  



end
