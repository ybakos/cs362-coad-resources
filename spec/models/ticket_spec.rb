require 'rails_helper'

RSpec.describe Ticket, type: :model do
    describe "methods" do
        let (:ticket) { Ticket.new }
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

        it "returns ticket and its number as a string when to_s is invoked" do
            expect(ticket.to_s).to eq("Ticket ")
            ticket.id = 14
            expect(ticket.to_s).to eq("Ticket 14")
        end
    end
end
