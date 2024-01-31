FactoryBot.define do

    sequence :name do |n|
        "fake_name_#{n}"
    end

    sequence :email do |n|
        "fake_email_#{n}@somewhere.com"
    end

    sequence :primary_name do |n|
        "primary_name_#{n}"
    end

    sequence :secondary_name do |n|
        "secondary_name_#{n}"
    end
    
end