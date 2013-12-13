# encoding: utf-8
require 'spec_helper'

describe "CountryPages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  before { FactoryGirl.create(:country, code: "TT", name: "Country") }


  describe "country creation" do
    before { visit countries_path }

    describe "with invalid information" do

      it "should not create a country" do
        expect { click_button "Добавить" }.not_to change(Country, :count)
      end

      describe "error messages" do
        before { click_button "Добавить" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'country_name', with: "Новая страна" }
      before { fill_in 'country_code', with: "Нс" }

      it "should create a country" do
        expect { click_button "Добавить" }.to change(Country, :count).by(1)
      end
    end
  end



  describe "delete links" do
    before { visit countries_path }
    it { should have_link('delete', href: country_path(Country.first)) }
  end

  describe "country destruction" do

    describe "as correct user" do
      before { visit countries_path }

      it "should delete a country" do
        expect { click_link "delete" }.to change(Country, :count).by(-1)
      end
    end
  end



end
