# encoding: utf-8
require 'spec_helper'

describe Client do

  let(:client) { FactoryGirl.create(:client) }


  subject { client }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:country_id) }
  it { should respond_to(:relationships) } 
  it { should respond_to(:users) }
  
  
  describe  "when name is not present" do
    before { client.name = " " }
    it { should_not be_valid }
  end

  describe "when country_id is not present" do
    before { client.country_id = nil }
    it { should_not be_valid }
  end

  describe "Получение отчётов" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      user.save
      user.follow!(client)
    end

    its(:users) { should include(user) }
  end
end
