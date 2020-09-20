FactoryBot.define do
  factory :training_post do
    training_time { 1 }
    training_hits { 150 }
    training_impression { 'Writing test!' }
    address { ' 筑波ジャンボゴルフセンター'}
    user
  end
end
