FactoryBot.define do
  factory :user do
    nickname {"abenomasuku"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {"安倍"}
    first_name {"晋太郎"}
    family_name_kana {"アベ"}
    first_name_kana {"シンタロウ"}
    birthday {Faker::Date.between(from: '1924-04-29', to: '2020-10-01') }
  end
end
