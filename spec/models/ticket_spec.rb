require 'rails_helper'

RSpec.describe Ticket, type: :model do
    it 'has a region' do
        ticket = Ticket.new
        expect(ticket).to respond_to(:region)
    end

    it 'has a resource_category' do
        ticket = Ticket.new
        expect(ticket).to respond_to(:resource_category)
    end 

    it 'has a organziation' do
        ticket = Ticket.new
        expect(ticket).to respond_to(:organization)
    end
    
    it 'has a name' do
        ticket = Ticket.new
        expect(ticket).to respond_to(:name)
    end 

    it 'has a phone' do
        ticket = Ticket.new
        expect(ticket).to respond_to(:phone)
    end 

    it 'has a description' do
        ticket = Ticket.new
        expect(ticket).to respond_to(:description)
    end

    describe "ticket" do
        it {should belong_to(:region)}

        it {should belong_to(:resource_category)}

        it {should belong_to(:organization).optional}
    end



end
