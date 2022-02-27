FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { 'testing' }
    
    factory :admin do
      role { admin }
    end
  end
end