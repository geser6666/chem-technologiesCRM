# encoding: utf-8
FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  
  	factory :admin do
  	  admin true
  	end
  end

  
  factory :client do
     sequence(:name)  { |n| "Клиент #{n}" }
     sequence(:address)  { |n| "Адрес клиента #{n}" }

     country_id 1
  end

  factory :country do
     sequence(:name)  { |n| "Страна #{n}" }
     sequence(:code)  { |n| "С#{n}" }
  end
  factory :contacttype do
     sequence(:name)  { |n| "Тип контакта #{n}" }
  end
  factory :negotiation do
     sequence(:value)  { |n| "Переговоры #{n}" }
     
  end

end