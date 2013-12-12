# encoding: utf-8
require 'spec_helper'

describe "ClientPages" do
	subject { page }
	describe "index" do
		before do
			sign_in FactoryGirl.create(:user)
			FactoryGirl.create(:client, name: "Bob", address: "Луганск")
			FactoryGirl.create(:client, name: "Ben", address: "Луганск")
			visit clients_path
		end

		it { should have_selector('title',	text: "Список клиентов") }
		it { should have_selector('h1',		text: "Список клиентов") }

		it "Should list each client" do
			Client.all.each do |client|
				page.should have_selector('li', text: client.name)
			end
		end

		describe "pagination" do
			before(:all) { 35.times { FactoryGirl.create(:client) } }
			after(:all)  { Client.delete_all }

			it { should have_selector('div.pagination') }

			it "should list each user" do
				Client.paginate(page: 1).each do |client|
					page.should have_selector('li', text: client.name)
				end
			end
		end

		describe "toggling the button" do
          before { click_button "Получать" }
          it { should have_selector('input', value: 'Не получать') }
        end
	end

	describe "Создание клиента" do
		let(:country) {FactoryGirl.create(:country)}
		before do 
			country.save
			sign_in FactoryGirl.create(:user)
			visit new_client_path 
		end
		
		it { should have_selector('title', text: "Новый клиент") }
		it { should have_selector('h1', text: "Новый клиент") }

		describe "при некорректных данных" do
			it "клиент не должен создаться" do
				expect{ click_button "Создать" }.not_to change(Client, :count)
			end

			describe "после отправки данных" do
				before { click_button "Создать" }
				it { should have_selector('title', text: "Новый клиент") }
				it { should have_content('error') }
			end
		end

		describe "при корректных данных" do			
			before do				
				fill_in "client_name", with: "Рога и копыта ООО"
				fill_in	"client_address", with: "Город, улица, дом"
				select country.name , from: "client_country_id"
			end

			it "клиент должен быть создан" do
				expect{ click_button "Создать" }.to change(Client, :count).by(1)
			end

			describe "после сохранения клиента" do
				before { click_button "Создать" }

				let(:client) { Client.find_by_name("Рога и копыта ООО") }

				it { should have_selector('title', text: client.name) }
				it { should have_selector('div.alert.alert-success', text: 'Клиент успешно создан.') }
			end
    end

    describe 'одновременное добавление контактов' do
      it { should have_selector('a', text: 'Добавить контакт') }
    end
	end

	describe "Редактирвоание клиента" do
		let(:country) { FactoryGirl.create(:country) }
		let(:client) { FactoryGirl.create(:client) }
		before do
			sign_in FactoryGirl.create(:user)
			client.country_id = country.id			
			client.save
			visit edit_client_path(client)			
		end

		describe "страница" do
			it{ should have_selector('title', text: 'Редактирвоание информации о клиенте') }
			it{ should have_selector('h1', text: 'Редактирвоание информации о клиенте') }
		end

		describe "при некорректных данных" do
			before do 
				fill_in "client_name", with: ''
				click_button "Сохранить" 
			end

			it{ should have_content("error") }
		end

		describe "при корректных данных" do
			before do
				fill_in "client_name", with: 'New company name'
				click_button "Сохранить"
			end

			it { should have_selector('title', text: 'New company name') }
			it { should have_selector('div.alert.alert-success', text: 'Сохранение прошло успешно') }

		end
	end
end
