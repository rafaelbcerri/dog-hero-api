FactoryBot.define do

  factory :role, aliases: [:pet_owner_role]  do
    name { 'pet_owner' }
  end

  factory :user, aliases: [:pet_owner_user] do
    name { 'João' }
    email { 'joao@gmail.com' }
    password { '123123' }
    password_confirmation { '123123' }
    association :role, factory: :pet_owner_role
  end

  factory :dog do
    name { 'Dog' }
    age { 6 }
    association :user, factory: :pet_owner_user
  end

  factory :dog_walking do
    duration { 30 }
    latitude { '-23.534296' }
    longitude { '-46.724113' }
    scheduled_date { Time.parse('Nov 9 2019 16:30') }
    dog_walking_status_id { 4 }
    begin_date { Time.parse('Nov 9 2019 16:30') }
    end_date { Time.parse('Nov 9 2019 17:00') }
    price { 40.0 }
    dogs { [] }
    association :user, factory: :pet_owner_user
  end

end