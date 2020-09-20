FactoryBot.define do
  factory :training_post do
    training_impression { 'Writing test!' }
    user
  end
end
