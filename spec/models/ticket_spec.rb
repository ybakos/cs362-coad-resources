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

        it {should belong_to(:organization)}
    end
    
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:region_id)}
    it {should validate_presence_of(:resource_category_id)}

    it {should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)}
    it {should validate_length_of(:description).is_at_most(1020).on(:create)}
    it "validates phone using phony_plausible" do
        expect(Ticket.validators_on(:phone)).to include(PhonyPlausibleValidator)
    end
end
