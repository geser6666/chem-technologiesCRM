# encoding: utf-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admin
    make_countries
    make_contacttypes
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
     ContactType.create!(name: "Телефон")
     ContactType.create!(name: "E-mail")
     ContactType.create!(name: "Skype")
  end


end