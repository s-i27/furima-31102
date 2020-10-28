FactoryBot.define do
  factory :order_addres do
    postcode        { '111-1111' }
    prefecture_id   { 2 } 
    building        { '渋谷テスト' } 
    block           { '2-2-2' }
    city            { '東京都' }
    phone_number    { '11111111111' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end