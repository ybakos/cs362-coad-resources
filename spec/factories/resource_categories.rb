FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |n| "Fake Resource Category #{n}" }

    factory :active_resource do
      active { true }
    end

    factory :inactive_resource do
      active { false }
    end
  end
end