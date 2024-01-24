require 'rails_helper'

RSpec.describe Region, type: :model do
  it "has a name" do
    region = Region.new
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

end
