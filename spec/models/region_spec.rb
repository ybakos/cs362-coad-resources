require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) {build(:region, :name => 'Mt. Hood')}
  
  # setup do
      # @region2 = build(:region, :name => 'Bend')
      # @region3 = build(:region, :name => 'KFalls')
  # end

  it "has a name" do
    # region = build(:region)
    # region = build(:region, :name  => "differentName")
    expect(region).to respond_to(:name)
  end

  it 'has a tickets' do
    region = Region.new
    expect(region).to respond_to(:tickets)
  end

  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    region = Region.new(name: name)
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
  region= Region.new
  expect(region.name).to eq(region.to_s());
end 

end
