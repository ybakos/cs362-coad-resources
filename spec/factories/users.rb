FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { 'testing' }
    
    factory :admin do
      role { admin }
    end

    factory :user_with_organization do
      organization { create(:organization) }
    end

    factory :user_without_organization do
      organization { nil }
    end
  end
end
