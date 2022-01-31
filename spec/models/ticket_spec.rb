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
    end
end
