# encoding: utf-8
require 'spec_helper'

describe "CountryPages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }


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
      it "should create a country" do
        expect { click_button "Добавить" }.to change(Country, :count).by(1)
      end
    end
  end
end
