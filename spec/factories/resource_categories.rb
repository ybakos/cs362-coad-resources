FactoryBot.define do
  factory :resource_category do
    name { 'Fake Resource Category' }

    factory :active_resource do
      active { true }
    end

    factory :inactive_resource do
      active { false }
    end
  end
end