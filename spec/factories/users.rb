FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { 'test' }
    
    factory :admin do
      role { admin }
    end
  end
end