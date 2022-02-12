FactoryBot.define do
  factory :organization do
    sequence(:name) { |n| "Fake Organization #{n}" }
    sequence(:email) { |n| "FakeEmail#{n}@gmail.com" }
    phone { '+15413215678' }
    status { :submitted }
    primary_name { 'FakeName' }
    secondary_name { 'SecondaryFakeName' }
    secondary_phone { '+15419874567' }
  end
end