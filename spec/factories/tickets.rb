FactoryBot.define do
  factory :organizations do
    name { 'Fake Ticket' }
    phone { '+15412345678' }
    region_id { 1 }
    resource_category_id = { 1 }
  end
end