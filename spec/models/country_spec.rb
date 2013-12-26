# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Country do

  before { @country = Country.new(name: "Test Country", code: "TC") }

  subject { @country }

  it { should respond_to(:name) }
  it { should respond_to(:code) }

   it { should be_valid }

  describe "when name is not present" do
    before { @country.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @country.code = " " }
    it { should_not be_valid }
  end



end