require 'spec_helper'

describe ContactType do

  before { @contacttype = ContactType.new(name: "Test Country") }

  subject { @contacttype }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @contacttype.name = " " }
    it { should_not be_valid }
  end



end