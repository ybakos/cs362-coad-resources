require 'rails_helper'

RSpec.describe User, type: :model do

    describe "methods" do
        let (:user) { User.new }
        it "sets default role to an organization" do
            expect(user.role).to eql("organization")
        end

        it "returns the user's email when to_s is invoked" do
            expect(user.to_s).to eql(user.email)
        end
    end
    
    describe "validations" do
        it "has an email" do
            user = User.new(email: "r@s.org")
            expect(user).to respond_to(:email)
        end

        it "cannot have a blank email" do
            user = User.new(email: "r@s.org", password: "lemonade")
            expect(user).to be_valid
            user.email = nil
            expect(user).to_not be_valid
            expect(user).to validate_presence_of(:email)
        end

        it "cannot have an email length longer than 255" do
            user = User.new(email: "r@s.org", password: "lemonade")
            expect(user).to be_valid
            user.email = "9" * 246 + "@gmail.com"
            expect(user).to_not be_valid 
        end

        it "must have valid email format" do
            user = User.new(email: "r@s.org", password: "lemonade")
            expect(user).to be_valid
            user.email = "invalid"
            expect(user).to_not be_valid
        end

        it "must have a unique email" do
            user = User.create!(email: "r@s.org", password: "lemonade")
            dupe = User.new(email: "rdupe@s.org", password: "lemonade")
            expect(dupe).to be_valid
            dupe.email = "r@s.org"
            expect(dupe).to_not be_valid
        end

        it "has a password" do
            user = User.new(password: "lemonade")
            expect(user).to respond_to(:email)
        end

        it "cannot have a blank password" do
            user = User.new(email: "r@s.org", password: "lemonade")
            expect(user).to be_valid
            user.password = nil
            expect(user).to_not be_valid
            expect(user).to validate_presence_of(:password)
        end
        
        it "cannot have an password length longer than 255" do
            user = User.new(email: "r@s.org", password: "lemonade")
            expect(user).to be_valid
            user.password = "9" * 256
            expect(user).to_not be_valid 
        end
    end
end
