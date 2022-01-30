require 'rails_helper'

RSpec.describe User, type: :model do

    describe "validations" do
        it "has an email" do
            user = User.new(email: "r@s.org")
            expect(user).to respond_to(:email)
        end

        it "cannot have a blank name" do
            user = User.new(email: "r@s.org", password: "lemonade")
            expect(user).to be_valid
            user.email = nil
            expect(user).to_not be_valid
            expect(user).to validate_presence_of(:email)
        end

        it "cannot have an email length longer than 255" do
            user = User.new(email: "r@s.org", password: "lemonade")
            expect(user).to be_valid
            user.email = "9" * 256
            expect(user).to_not be_valid 
        end
    end

end
