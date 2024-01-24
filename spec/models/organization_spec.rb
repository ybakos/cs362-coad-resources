require 'rails_helper'

RSpec.describe Organization, type: :model do
    it 'has a status' do
        organization = Organization.new
        expect(organization).to respond_to(:status)
    end

    it 'has a name' do
        organization = Organization.new
        expect(organization).to respond_to(:name)
    end

    it 'has a email' do
        organization = Organization.new
        expect(organization).to respond_to(:email)
    end

    it 'has a phone' do
        organization = Organization.new
        expect(organization).to respond_to(:phone)
    end

    it 'has a primary_name' do
        organization = Organization.new
        expect(organization).to respond_to(:primary_name)
    end
    
    it `has a secondary_name` do
        organization = Organization.new
        expect(organization).to respond_to(:primary_name)
    end

    it `has a secondary_phone` do
        organization = Organization.new
        expect(organization).to respond_to(:secondary_phone)
    end

    it `has a agreement_one` do
        organization = Organization.new
        expect(organization).to respond_to(:agreement_one)
    end

    it `has a agreement_two` do
        organization = Organization.new
        expect(organization).to respond_to(:agreement_two)
    end

    it `has a agreement_three` do
        organization = Organization.new
        expect(organization).to respond_to(:agreement_three)
    end

    it `has a agreement_four` do
        organization = Organization.new
        expect(organization).to respond_to(:agreement_four)
    end

    it `has a agreement_five` do
        organization = Organization.new
        expect(organization).to respond_to(:agreement_five)
    end

    it `has a agreement_six` do
        organization = Organization.new
        expect(organization).to respond_to(:agreement_six)
    end

    it `has a agreement_seven` do
        organization = Organization.new
        expect(organization).to respond_to(:agreement_seven)
    end

    it `has a agreement_eight` do
        organization = Organization.new
        expect(organization).to respond_to(:agreement_eight)
    end

    describe "organization" do 
        it {should have_many(:tickets)}

        it {should have_many(:users)}

        it {should have_and_belong_to_many(:resource_categories)}
    end

    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:primary_name)}
    it {should validate_presence_of(:secondary_name)}
    it {should validate_presence_of(:secondary_phone)}

    it {should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)}
    it {should have_attribute(:email)}
    it {should validate_uniqueness_of(:email).case_insensitive()}

    it {should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)}
    it {should validate_uniqueness_of(:name).case_insensitive()}

    it {should validate_length_of(:description).is_at_most(1020).on(:create)}
end
