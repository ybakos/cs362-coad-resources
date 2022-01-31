require 'rails_helper'

RSpec.describe Ticket, type: :model do

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
