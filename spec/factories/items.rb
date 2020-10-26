FactoryBot.define do
  factory :item do
    # image { File.open("#{Rails.root}/spec/images/test.png") }
    name {"マスク"}
    description {"洗って何回も使える"}
    genre_id {1}
    condition_id {1}
    delivery_fee_id {1}
    delivery_date_id {1}
    prefecture_id {1}
    price {3500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
