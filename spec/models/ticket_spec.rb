require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let(:ticket) {build(:ticket, :name => 'Mt Hood')}

    setup do
        @ticket2 = build(:ticket)
        # pp @ticket2.to_s
        @ticket3 = build(:ticket)
        # pp @ticket3.to_s
    end

    #changes above. Not added, not committed, not pushed. 

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
    
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:region_id)}
    it {should validate_presence_of(:resource_category_id)}

    it {should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)}
    it {should validate_length_of(:description).is_at_most(1020).on(:create)}

    describe "validates phone numbers" do
        it {should allow_value("+1-555-555-1212").for(:phone)}
        it {should_not allow_value("popcorn").for(:phone)}
    end


    it "validates phone using phony_plausible" do
        expect(Ticket.validators_on(:phone)).to include(PhonyPlausibleValidator)
    end

    describe "#open?" do 
        it 'returns true if closed if false ' do 
            ticket = Ticket.new
            ticket.closed = false 
            expect(ticket.open?).to eq(true);
        end 
        it 'returns false if closed if true ' do 
            ticket = Ticket.new
            ticket.closed = true
            expect(ticket.open?).to eq(false);
        end 
    end
 
    describe "#captured?" do 
        it 'returns true if present  ' do 
            ticket = Ticket.new
            org= Organization.new
            ticket.organization= org

            expect(ticket.captured?).to eq(true);
        end 
        it 'returns false if closed if true ' do 
            ticket = Ticket.new
            
            expect(ticket.captured?).to eq(false);
        end 
    end      

    it '#to_s' do 
        ticket= Ticket.new
        expect("Ticket #{ticket.id}").to eq(ticket.to_s());
    end 

end
