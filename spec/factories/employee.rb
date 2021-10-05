FactoryBot.define do
    factory :employee do
        name {Faker::Name.first_name}
        lastname {Faker::Name.last_name}
        address {Faker::Address.city}
        phone {Faker::PhoneNumber.phone_number}
        salary {Faker::Number.number(digits: 4)}
    end
end