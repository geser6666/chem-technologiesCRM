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
 
 #let(:user) { FactoryGirl.create(:user) }
 #let(:client) {FactoryGirl.create(:client) }
 let(:negotiation) { FactoryGirl.create(:negotiation, user: @user, client: @client) }
  subject { negotiation }

 it { should respond_to(:value) }

 describe 'when client_id is not present' do
    before { negotiation.client_id = nil }
    it { should_not be_valid }
  end
 describe 'when user_id is not present' do
    before { negotiation.user_id = nil }
    it { should_not be_valid }
  end

end
