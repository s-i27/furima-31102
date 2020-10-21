FactoryBot.define do
  factory :item do
    name { 'pen' }
    comment               { 'test' }
    category_id           { '2' }
    status_id             { '2' }
    shipping_at_id        { '2' }
    shipping_area_id      { '2' }
    shipping_date_id      { '2' }
    price                 { '300' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'test_image.png')
    end
  end
end
