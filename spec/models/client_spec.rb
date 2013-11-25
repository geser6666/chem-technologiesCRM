require 'spec_helper'

describe Client do

#  let(:client) { FactoryGirl.create(:client) }
  before do
    
    @client = Client.new(name: "Test client", address: "Test Address", country_id: 1)
  end

  subject { @client }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:country_id) }
  
   it { should be_valid }

  describe "when country_id is not present" do
    before { @client.country_id = nil }
    it { should_not be_valid }
  end



end
