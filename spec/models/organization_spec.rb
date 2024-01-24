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
end
