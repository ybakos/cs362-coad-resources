FactoryBot.define do

    factory :organization do
        name
        email
        phone {"1-567-983-1023"};
        primary_name
        secondary_name
        secondary_phone {"1-345-896-1002"};
    end

end