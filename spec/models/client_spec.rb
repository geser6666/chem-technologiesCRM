require 'spec_helper'

describe Client do

#  let(:client) { FactoryGirl.create(:client) }
  let(:country) { Country.new(name: "Test Countru", code: "TC") }
  before do
    #@country= Country.new(name: "Test Countru", code: "TC")
    @client = Client.new(name: "Test client", address: "Test Address", country_id: country.id)
    
  end

  subject { @client }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:country_id) }
  
  
  describe  "when name is not present" do
    before { @client.name = " " }
    it { should_not be_valid }
  end

  describe "when country_id is not present" do
    before { @client.country_id = nil }
    it { should_not be_valid }
  end



end
