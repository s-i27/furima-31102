FactoryBot.define do
  factory :user do
    nickname              { 'yama' }
    email                 { 'test@gmail.com' }
    password              { 'a00000' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1931-03-01' }
    id                    { '1' }
  end
end
