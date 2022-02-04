require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "methods" do
    let (:ticket) { build(:ticket) }

    it "returns false from the open? method if :closed is true" do
      ticket.closed = true
      expect(ticket.open?).to eq(false)
    end

    it "returns true from the open? method if :closed is false" do
      ticket.closed = true
      expect(ticket.open?).to eq(false)
      ticket.closed = false
      expect(ticket.open?).to eq(true)
    end

    it "returns true from the captured? method if organization is set" do
      expect(ticket.captured?).to eq(false)
      global_penguin_society = Organization.new
      ticket.organization = global_penguin_society
      expect(ticket.captured?).to eq(true)
    end

    it "returns false from the captured? method if organization is not set" do
      expect(ticket.captured?).to eq(false)
    end

    it "has a string representation of ticket and its id" do
      expect(ticket.to_s).to eq("Ticket ")
      ticket.id = 14
      expect(ticket.to_s).to eq("Ticket 14")
    end
  end
  
  describe "validations" do
    let(:ticket) { Ticket.new }

    it "has a name" do
      ticket.name = "chip"
      expect(ticket).to respond_to(:name)
    end

    it "has a phone number" do
      ticket.phone = "3214201337"
      expect(ticket).to respond_to(:phone)
    end

    it "has a region id" do
      ticket.region_id = 42 
      expect(ticket).to respond_to(:region_id)
    end

    it "has a resource_category_id" do
      ticket.resource_category_id = 7  
      expect(ticket).to respond_to(:resource_category_id)
    end
    
    it "cannot have a blank name" do
      region = Region.create!(name: "42")
      resource_category = ResourceCategory.create!(name: "rc")
      ticket.name = "valid"
      ticket.phone = "+15417977899"
      ticket.description = "345820"
      ticket.region_id = region.id
      ticket.resource_category_id = resource_category.id
      expect(ticket).to be_valid
      ticket.name = nil
      expect(ticket).to_not be_valid
      expect(ticket).to validate_presence_of(:name)
    end

    it "cannot have a length longer than 255" do
      region = Region.create!(name: "42")
      resource_category = ResourceCategory.create!(name: "rc")
      ticket.name = "valid"
      ticket.phone = "+15417977899"
      ticket.region_id = region.id 
      ticket.resource_category_id = resource_category.id 
      expect(ticket).to be_valid
      ticket.name = "9" * 256
      expect(ticket).to_not be_valid
    end
      
    it "has a valid phone number" do
      region = Region.create!(name: "42")
      resource_category = ResourceCategory.create!(name: "rc")
      ticket.name = "valid"
      ticket.phone = "+15417977899"
      ticket.region_id = region.id 
      ticket.resource_category_id = resource_category.id 
      expect(ticket).to be_valid
      ticket.phone = "101" 
      expect(ticket).to_not be_valid
    end
  end
end
