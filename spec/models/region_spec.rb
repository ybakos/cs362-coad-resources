require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) { build(:region) }

  it "exists" do
    expect(region).to_not eq(nil)
  end

  describe 'methods' do
    it 'returns its name from to_s' do
      expect(region.to_s).to eq(region.name)
    end
      
    it 'creates region with name if it doesnt previously exist' do
      region = Region.find_or_create_by(name: 'Unspecified')
      expect(region.name).to eq('Unspecified')
    end
  end

  describe "attributes" do
    it "has a name" do
      expect(region).to respond_to(:name)
    end
  end
  
  describe "validations" do
    it "cannot have a blank name" do
      expect(region).to be_valid
      region.name = nil
      expect(region).to_not be_valid
      expect(region).to validate_presence_of(:name)
    end
  
    it "cannot have a length longer than 255" do
      expect(region).to be_valid
      region.name = "9" * 256
      expect(region).to_not be_valid
    end
  
    it "must have a unique name" do
      #region = Region.create!(name: duplicate_name)
      #duplicate_region = Region.new(name: 'Unique Name')
      duplicate_region = build(:region, name: 'Unique Name')
      expect(duplicate_region).to be_valid
      duplicate_region.name = region.name 
      expect(duplicate_region).to be_invalid
    end
  end

end
