# encoding: utf-8
require 'spec_helper'

describe "CountryPages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { FactoryGirl.create(:country, code: "TT", name: "Country") }


  describe "for not signedin users" do
    before { visit contacttypes_path }
    it { should have_content('Вход') }
  end


  describe "for signedin users" do
    before { sign_in user }
    before { visit countries_path }

    describe "country creation" do
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
      describe "adding country" do
        before { fill_in 'country_name', with: "Новая страна" }
        before { fill_in 'country_code', with: "Нс" }
        
        before { click_button "Добавить" }
        it { should have_content('Новая страна') }
      end
    end



    describe "delete links" do
      before { visit countries_path }
      it { should have_link('', href: country_path(Country.first)) }
    end

    describe "country destruction" do

      describe "as correct user" do
        before { visit countries_path }

        it "should delete a country" do
          expect { click_link Country.first.name }.to change(Country, :count).by(-1)
        end
      end
    end

    describe "editing country " do
       before do
        click_link Country.first.id.to_s 
        fill_in 'country_name', with: "страна изменена" 
        click_button "Сохранить" 
       end
       it { should have_content('страна изменена') }
    end
  end
end
