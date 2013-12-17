# encoding: utf-8
require 'spec_helper'

describe "ContactType Pages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  before { FactoryGirl.create(:contacttype) }
  before { visit contacttypes_path }


  describe "right content" do
    it { should have_content('Типы контактов') }
  end


  describe "contacttype creation" do

    describe "with invalid information" do

      it "should not create a contacttype" do
        expect { click_button "Добавить" }.not_to change(Contacttype, :count)
      end

      describe "error messages" do
        before { click_button "Добавить" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'contacttype_name', with: "Новый тип контакта" }
      it "should create a contacttype" do
        expect { click_button "Добавить" }.to change(Contacttype, :count).by(1)
      end
    end

    describe "adding contacttype" do
      before { fill_in 'contacttype_name', with: "Новый тип контакта" }
      before { click_button "Добавить" }
      it { should have_content('created') }
    end
  end

  describe "edit links" do
    it { should have_link('', href: edit_contacttype_path(Contacttype.first)) }
  end

  describe "delete links" do
    it { should have_link('', href: contacttype_path(Contacttype.first)) }
  end

  describe "contacttype destruction" do
    describe "as correct user" do
      it "should delete a country" do
        expect { click_link Contacttype.first.name }.to change(Contacttype, :count).by(-1)
      end
    end
  end

  describe "editing contacttype " do
     before do
      expect { click_link Contacttype.first.id }
      fill_in 'contacttype_name', with: "Измененный тип контакта" 
      expect { click_link "Сохранить" }
     end
     
     
     it { should have_content('') }


    
  end



end
