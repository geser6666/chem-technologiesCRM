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
	end
end
