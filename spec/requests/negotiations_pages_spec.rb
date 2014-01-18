# encoding: utf-8
require 'spec_helper'

describe "NegotiationsPages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  
  describe "for not signedin users" do
    before { visit negotiations_path }
    it { should have_content('Вход') }
  end
  describe "index" do
    before do
        sign_in user
        FactoryGirl.create(:client, name: "Bob", address: "Луганск")
        FactoryGirl.create(:client, name: "Ben", address: "Луганск")
        visit negotiations_path
    end

    it { should have_selector('title',        text: "Переговоры") }
    it { should have_selector('h4',                text: "Список клиентов") }
    it { should have_selector('h4',                text: "Переговоры") }

    it "Should list each client" do
            Client.all.each do |client|
                    page.should have_selector('li', text: client.name)
            end
    end
    it "Should have right links" do
            Client.all.each do |client|
                    page.should have_link(client.name, href: client_negotiations_path(client)) 
            end
    end

    describe "pagination" do
            before(:all) { 35.times { FactoryGirl.create(:client) } }
            after(:all) { Client.delete_all }

            it { should have_selector('div.pagination') }

            it "should list each user" do
                    Client.paginate(page: 1).each do |client|
                            page.should have_selector('li', text: client.name)
                    end
            end
    end
	
	describe "get right negotiations " do
        let(:client) { FactoryGirl.create(:client) }

        before do
            client.negotiations.build(value:'Negotiation 1', user_id: user.id)
            client.save

            visit client_negotiations_path(client)
        end
        it { should have_link('Negotiation 1') }
	end

    describe "should have form new negotiation" do
        let(:client) { FactoryGirl.create(:client) }

        before do
          visit client_negotiations_path(client)
        end

        it {should have_}

    end


end



end