FactoryBot.define do
  factory :organization do
    name { 'Fake Organization' }
    email { 'FakeEmail@FakeEmail.com' }
    phone { '+15413215678' }
    status { :submitted }
    primary_name { 'FakeName' }
    secondary_name { 'SecondaryFakeName' }
    secondary_phone { '+15419874567' }
  end
end