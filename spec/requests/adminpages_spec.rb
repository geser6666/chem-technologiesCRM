require 'spec_helper'

describe "Adminpages" do
  describe "GET /adminpages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get adminpages_path
      response.status.should be(200)
    end
  end
end
