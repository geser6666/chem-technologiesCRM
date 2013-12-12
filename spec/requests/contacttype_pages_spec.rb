# encoding: utf-8
require 'spec_helper'

describe "ContactType Pages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }


  describe "contacttype creation" do
    before { visit contacttypes_path }

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
end
