FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { 'password' }
    
    factory :admin do
      role { admin }
    end
  end
end