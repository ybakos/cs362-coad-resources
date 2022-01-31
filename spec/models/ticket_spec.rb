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
    end

end
