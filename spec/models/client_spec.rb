# encoding: utf-8
# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  country_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Client do

  let(:client) { FactoryGirl.create(:client) }


  subject { client }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:country_id) }
  it { should respond_to(:relationships) } 
  it { should respond_to(:users) }
  it { should respond_to(:contacts) }

  describe 'when name is not present' do
    before { client.name = " " }
    it { should_not be_valid }
  end

  describe 'when country_id is not present' do
    before { client.country_id = nil }
    it { should_not be_valid }
  end

  describe 'Получение отчётов' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      user.save
      user.follow!(client)
    end

    its(:users) { should include(user) }
  end
end
