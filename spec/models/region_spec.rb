require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) {build(:region, :name => 'Mt. Hood')}
  


  it "has a name" do
   
    expect(region).to respond_to(:name)
  end

  it 'has a tickets' do
    
    expect(region).to respond_to(:tickets)
  end

  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    
    result = region.to_s
  end

  describe "region" do
    it {should have_many(:tickets)}
  end

  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)}
  it {should validate_uniqueness_of(:name).case_insensitive()}


  it '#unspecified' do 
  region = Region.unspecified
  expect(region.name).to eq("Unspecified");
end

it '#to_s' do 

  expect(region.name).to eq(region.to_s());
end 

end
