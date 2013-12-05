require 'spec_helper'

describe "Adminpages" do
  describe "GET /adminpages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get adminpage_path
      response.status.should be(200)
    end
  end
  describe "for signedin users" do
  	 let(:user) { FactoryGirl.create(:user) }
  	 before do
  	 	sign_in user
  	 	visit adminpage_path
  	 end
    describe  "should have the content Admin Page" do
    	it { should have_selector('h1',     text: 'Admin page') }
    end
  end
end

describe "Countries" do
	

end
