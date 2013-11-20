# encoding: utf-8
namespace :db do
  desc "Fill countries sample data"
  task populatecountries: :environment do
    make_countries
    
#   
  end

  def make_countries
       Country.create!(name: 'Украина')
       Country.create!(name: 'Литва')
       Country.create!(name: 'Китай')
       Country.create!(name: 'Россия')


  end
end