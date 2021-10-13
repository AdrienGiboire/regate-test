FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    base_experience { Faker::Number.number(digits: 2) }
    height { Faker::Number.number(digits: 2) }
    is_default { Faker::Boolean.boolean }
    order { Faker::Number.number(digits: 2) }
    weight { Faker::Number.decimal(l_digits: 2) }

    after :create do |pokemon|
      types = FactoryBot.create_list :type, 2
      pokemon.types << types
      pokemon.save
    end
  end
end
