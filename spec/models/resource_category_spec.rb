require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  describe "methods" do
    let (:resource_category) { build(:resource_category) }
    let (:active_resource) { build(:active_resource) }
    let (:inactive_resource) {build(:inactive_resource) }

    it "returns ResourceCategory object with name as Unspecified" do
      resource_category = ResourceCategory.unspecified
      expect(resource_category.name).to eq('Unspecified')
    end

    it "sets active attribute to true when activate method is invoked" do
      expect(inactive_resource.active).to eq(false)
      inactive_resource.activate
      expect(inactive_resource.active).to eq(true)
    end

    it "sets active attribute to false when deactivate method is invoked" do
      expect(active_resource.active).to eq(true)
      active_resource.deactivate
      expect(active_resource.active).to eq(false)
    end

    it "returns true for inactive? method if not active" do
      expect(active_resource.inactive?).to eq(false)
      active_resource.active = false
      expect(active_resource.inactive?).to eq(true)
    end

    it "returns false for inactive? method if active" do
      expect(inactive_resource.inactive?).to eq(true)
      inactive_resource.active = true
      expect(inactive_resource.inactive?).to eq(false)
    end

    it "returns name of resource category when to_s is invoked" do
      expect(resource_category.to_s).to_not be('Snow Removal')
      resource_category.name = 'Snow Removal'
      expect(resource_category.to_s).to eq('Snow Removal')
    end
  end
end
