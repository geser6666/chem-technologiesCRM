# encoding: utf-8
require 'spec_helper'
require 'action_view'
include ActionView::Helpers::TextHelper

describe "Static pages" do
  
  subject { page } 

  shared_examples_for "all static pages" do
    it { should have_selector('h1',     text: heading) }
    it { should have_selector('title',  text: full_title(page_title)) }   
  end

  describe "Home page" do
    before {visit root_path}
    let(:heading)   { 'Chem Technologies' }
    let(:page_title){ '' }

    it_should_behave_like  "all static pages"

    it { should_not have_selector('title', :text => "| Home") }    

    describe "for signed-in user" do
      let(:user) { FactoryGirl.create(:user) }
      before do 
        sign_in user                 
      end 
    end
  end

  it "should have the right links on the layout" do
      visit root_path    
    click_link "Home"
    click_link "signup"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "Chem Technologies"
    #page.should have_selector 'h1', text: 'Sample App'
    page.should have_selector 'title', text: full_title('')
  end
  
  describe "Admin page" do
    before {visit root_path}
    let(:heading)   { 'Chem Technologies' }
    let(:page_title){ '' }
    it_should_behave_like  "all static pages"
    
    describe "for signed-in user" do
      let(:user) { FactoryGirl.create(:user) }
      before do 
        sign_in user    
        visit adminpage_path
      end 
      describe  "should have the content Admin Page" do
        
        it { should have_selector('h1',     text: 'Admin page') }
      end
      describe  "should have right links " do

       it { should have_link("Страны", href: '#countries') }
       it { should have_link("Типы контактов", href: '#contacttypes') }
      end  
      describe "directoryes" do
         describe "check  visiting countries" do
           before do
            @country = Country.create!(code: 'UA', name: 'Украина')
            @country.save
            visit '#countries'
           end
          it { should have_selector('li',     text: '') }  
         end
        


      end   



    end
    
    describe "for non signed-in user" do
      before {visit adminpage_path}
      describe  "should not have the content Admin Page" do
        it { should_not have_selector('h1',     text: 'Admin page') }
      end
      describe  "should have the content Signin" do
        it {should have_selector('title', text: 'Sign in')}
      end

    end

    

  end


end