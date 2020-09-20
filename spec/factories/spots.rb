FactoryBot.define do
  factory :spot do
    address { '筑波ジャンボゴルフセンター' }
    latitude { 40.7143528 }
    longitude { -74.0059731 }
    training_post
  end
end
