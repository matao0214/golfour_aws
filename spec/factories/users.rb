FactoryBot.define do
  factory :user do
    nickname {'RSpec'}
    email {'RSpec@example.com'}
    password {'password'}
    golf_reki {'未経験'}
    goal {'テストを通す'}
  end
end
