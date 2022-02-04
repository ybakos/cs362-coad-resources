require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    describe "methods" do
        let (:resource_category) { ResourceCategory.new }
        it "returns ResourceCategory object with name as Unspecified" do
            resource_category = ResourceCategory.unspecified
            expect(resource_category.name).to eq('Unspecified')
        end

        it "sets active attribute to true when activate method is invoked" do
            resource_category.active = false
            expect(resource_category.active).to eq(false)
            resource_category.activate
            expect(resource_category.active).to eq(true)
        end

        it "sets active attribute to false when deactivate method is invoked" do
            resource_category.active = true
            expect(resource_category.active).to eq(true)
            resource_category.deactivate
            expect(resource_category.active).to eq(false)
        end

        it "returns true for inactive? method if not active" do
            resource_category.active = true
            expect(resource_category.inactive?).to eq(false)
            resource_category.active = false
            expect(resource_category.inactive?).to eq(true)
        end

        it "returns false for inactive? method if active" do
            resource_category.active = false
            expect(resource_category.inactive?).to eq(true)
            resource_category.active = true
            expect(resource_category.inactive?).to eq(false)
        end

        it "returns name of resource category when to_s is invoked" do
            expect(resource_category.to_s).to_not be('Snow Removal')
            resource_category.name = 'Snow Removal'
            expect(resource_category.to_s).to eq('Snow Removal')
        end

    end

    describe "validations" do 
        let (:resource_category) { ResourceCategory.new }
        it "has a name" do
            expect(resource_category).to_not be_valid
            expect(resource_category).to validate_presence_of(:name)
            resource_category.name = 'resource category'
            expect(resource_category).to be_valid
        end

        it "has a valid name when length 1 or greater" do
            expect(resource_category).to_not be_valid
            resource_category.name = ''
            expect(resource_category).to_not be_valid
            resource_category.name = 'a'
            expect(resource_category).to be_valid
        end

        it "has a valid name when length 255 or lower" do
            expect(resource_category).to_not be_valid
            resource_category.name = 'a' * 256
            expect(resource_category).to_not be_valid
            resource_category.name = 'a'
            expect(resource_category).to be_valid
        end

        it "cannot have a blank name" do
            expect(resource_category).to_not be_valid
            expect(resource_category).to validate_presence_of(:name)
        end

        it "has a unique name" do
            resource_category_1 = ResourceCategory.create!(name: 'a')
            resource_category_2 = ResourceCategory.new(name: 'ab')
            expect(resource_category_2).to be_valid
            resource_category_2.name = 'a'
            expect(resource_category_2).to_not be_valid
        end
    end

end
