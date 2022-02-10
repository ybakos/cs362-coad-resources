FactoryBot.define do
  factory :ticket do
    name { 'Fake Ticket' }
    description { 'Fake ticket description' }
    phone { '+15412345678' }
    closed { false }
    region
    resource_category
  end
end