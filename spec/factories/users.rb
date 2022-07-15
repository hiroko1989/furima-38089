FactoryBot.define do
  
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"h6"+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name { person.first.kanji }
    family_name { person.family.kanji }
    ruby_first_name { person.first.katakana }
    ruby_family_name { person.family.katakana }
    birth_date { Faker::Date.backward }
  end
end