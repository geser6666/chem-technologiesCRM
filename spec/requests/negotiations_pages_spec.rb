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
            @negotiation = client.negotiations.build(value:'Negotiation 1', user_id: user.id)
            client.save
            @negotiation.save

            visit client_negotiations_path(client)
            @ppp = edit_client_negotiation_path(client, @negotiation.id)
        end
        it { should have_link('Negotiation 1',href: @ppp) }
	end

    describe "should have form new negotiation" do
        let(:client) { FactoryGirl.create(:client) }

        before do
          visit client_negotiations_path(client)
        end
   		it { should have_selector('form', id: 'new_negotiation') }
    end

    describe "adding new negotiation" do
        let(:client) { FactoryGirl.create(:client) }
        before do
          visit client_negotiations_path(client)
          fill_in "negotiation_value", with: "Example negotiation"
        end
        
        it "should create a negotiation" do
            expect { click_button "Post" }.to change(Negotiation, :count).by(1)
        end
        


    end
    describe "should have form edit negotiation" do
        let(:client) { FactoryGirl.create(:client) }
        before do
            @negotiation = client.negotiations.build(value:'Negotiation 1', user_id: user.id)
            client.save
            @negotiation.save
          visit edit_client_negotiation_path(client, @negotiation.id)
        end
        it { should have_selector('form', class: 'edit_negotiation') }
        describe "edit negotiation" do
            before do
                fill_in "negotiation_value", with: "Example negotiation"
                click_button "Post"
            end   
            it { should have_link('Example negotiation') } 

        end


    end


end



end
