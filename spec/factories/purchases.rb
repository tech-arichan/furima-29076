FactoryBot.define do
  factory :purchase do
    postal_code {'123-4567'}
    prefecture_id {1}
    city {'小城市'}
    house_number {'123'}
    phone_number {'12345678910'}
  end
end
