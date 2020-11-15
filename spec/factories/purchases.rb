FactoryBot.define do
  factory :purchase do
    postal_code {'123-4567'}
    prefecture_id {1}
    city {'小城市'}
    house_number {'123'}
    building_name {''}
    phone_number {'12345678910'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
