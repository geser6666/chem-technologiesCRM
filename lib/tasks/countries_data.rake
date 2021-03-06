# encoding: utf-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admin
    make_countries
    make_contacttypes

    #удалить перед деплоем
    make_clients
  end
  task populatecountries: :environment do
    
  end
  def make_countries
       Country.create!(code: 'UA', name: 'Украина')
       Country.create!(code: 'LT', name: 'Литва')
       Country.create!(code: 'CN', name: 'Китай')
       Country.create!(code: 'RU', name: 'Россия')
  end
  
  def make_admin
    admin = User.create!( name:     "Administrator",
                          email:    "admin@chem-technologies.com",
                          password: "admin1",
                          password_confirmation: "admin1")
    admin.toggle!(:admin)
  end
  def make_contacttypes
     Contacttype.create!(name: "Телефон")
     Contacttype.create!(name: "E-mail")
     Contacttype.create!(name: "Skype")
  end

  def make_clients    
    99.times do |n|
      name  = Faker::Name.name
      address = "адрес-#{n}"
      @client=Client.create!(name: name,
                     address: address,
                     country_id: 1
                   )
    end

  end

end