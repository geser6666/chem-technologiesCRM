# == Schema Information
#
# Table name: contacttypes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Contacttype do

  before { @contacttype = Contacttype.new(name: "Test Country") }

  subject { @contacttype }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @contacttype.name = " " }
    it { should_not be_valid }
  end


end
