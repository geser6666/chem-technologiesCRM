# encoding: utf-8
require 'spec_helper'

describe "ContactType Pages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  before { FactoryGirl.create(:contacttype, name: "Country") }
  before { visit contacttypes_path }


  describe "contacttype creation" do

    describe "with invalid information" do

      it "should not create a contacttype" do
        expect { click_button "Добавить" }.not_to change(ContactType, :count)
      end

      describe "error messages" do
        before { click_button "Добавить" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'contacttype_name', with: "Новый тип контакта" }
      it "should create a contacttype" do
        expect { click_button "Добавить" }.to change(ContactType, :count).by(1)
      end
    end
  end

  describe "delete links" do
    it { should have_link('delete', href: contacttype_path(ContactType.first)) }
  end

  describe "contacttype destruction" do
    describe "as correct user" do
      it "should delete a country" do
        expect { click_link "delete" }.to change(ContactType, :count).by(-1)
      end
    end
  end


end
