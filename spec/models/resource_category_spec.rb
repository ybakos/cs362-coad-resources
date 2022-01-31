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

    end

end
