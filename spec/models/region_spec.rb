require 'rails_helper'

RSpec.describe Region, type: :model do

  it "exists" do
    Region.new
  end

  describe "attributes" do
    it "has a name" do
      region = Region.new
      expect(region).to respond_to(:name)
    end
  end

  describe "validations" do
    it "cannot have a blank name" do
      region = Region.new(name: 'Fake Region')
      expect(region).to be_valid
      region.name = nil
      expect(region).to_not be_valid
      expect(region).to validate_presence_of(:name)
    end

    it "cannot have a length longer than 255" do
      region = Region.new(name: 'Valid-Length Region')
      expect(region).to be_valid
      region.name = "9" * 256
      expect(region).to_not be_valid
    end

    it "must have a unique name" do
      duplicate_name = 'Fake Name'
      region = Region.create!(name: duplicate_name)
      duplicate_region = Region.new(name: 'Unique Name')
      expect(duplicate_region).to be_valid
      duplicate_region.name = duplicate_name
      expect(duplicate_region).to be_invalid
    end

end
