require 'rails_helper'

RSpec.describe User, type: :model do

  describe "methods" do
    let (:user) { FactoryBot.build(:user) }

    it "sets default role to an organization" do
      expect(user.role).to eql("organization")
    end

    it "returns the user's email when to_s is invoked" do
      expect(user.to_s).to eql(user.email)
      user.email = "turtle@oceanplastic.com"
      expect(user.to_s).to eql("turtle@oceanplastic.com")
    end
  end

  describe "associations" do
    it { should belong_to(:organization) }
  end
  
  describe "validations" do
    let (:complete_user) { User.new(email: "r@s.org", password: "lemonade")}
    
    it "has an email" do
      expect(complete_user).to respond_to(:email)
    end

    it "cannot have a blank email" do
      expect(complete_user).to be_valid
      complete_user.email = nil
      expect(complete_user).to_not be_valid
      expect(complete_user).to validate_presence_of(:email)
    end

    it "cannot have an email length longer than 255" do
      expect(complete_user).to be_valid
      complete_user.email = "9" * 246 + "@gmail.com"
      expect(complete_user).to_not be_valid 
    end

    it "must have valid email format" do
      expect(complete_user).to be_valid
      complete_user.email = "invalid"
      expect(complete_user).to_not be_valid
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
      expect(complete_user).to be_valid
      complete_user.password = nil
      expect(complete_user).to_not be_valid
      expect(complete_user).to validate_presence_of(:password)
    end
    
    it "cannot have an password length longer than 255" do
      expect(complete_user).to be_valid
      complete_user.password = "9" * 256
      expect(complete_user).to_not be_valid 
    end
  end
end
