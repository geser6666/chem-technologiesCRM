# encoding: utf-8
require 'spec_helper'

describe "Adminpages" do
  subject { page }
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
    describe  "should have right links" do
       it { should have_link("Страны", href: '#countries') } 
       it { should have_link("Типы контактов", href: '#contacttypes') }      
    end

    describe "directories" do
          before do
            @country = Country.create!(code: 'UA', name: 'Украина')
            @country.save
            @contacttype = ContactType.create!(name: 'Тип контакта1')
            @contacttype.save
            visit adminpage_path      
          end
         describe "check visiting countries" do
           
          it { should have_link(@country.name, href: @country) }
         end
         describe "check visiting contacttypes" do
          
          it { should have_link(@contacttype.name) }
         end
      end 
  end



  describe "for non signed-in user" do
    before { visit adminpage_path }
    describe  "should not have the content Admin Page" do
      it { should_not have_selector('h1',     text: 'Admin page') }
    end
    describe  "should have the content Signin" do
      it { should have_selector('li', text: 'Вход') }
    end
  end
end

