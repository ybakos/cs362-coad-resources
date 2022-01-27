require 'rails_helper'

RSpec.describe Organization, type: :model do

  it "exists" do
    Organization.new
  end

  describe "attributes" do
    it "has agreement_one" do
      organization = Organization.new
      expect(organization).to respond_to(:agreement_one)
    end
    it "has agreement_two" do
      organization = Organization.new
      expect(organization).to respond_to(:agreement_two)
    end
    it "has agreement_three" do
      organization = Organization.new
      expect(organization).to respond_to(:agreement_three)
    end
    it "has agreement_four" do
      organization = Organization.new
      expect(organization).to respond_to(:agreement_four)
    end
    it "has agreement_five" do
      organization = Organization.new
      expect(organization).to respond_to(:agreement_five)
    end
    it "has agreement_six" do
      organization = Organization.new
      expect(organization).to respond_to(:agreement_six)
    end
    it "has agreement_seven" do
      organization = Organization.new
      expect(organization).to respond_to(:agreement_seven)
    end
    it "has agreement_eight" do
      organization = Organization.new
      expect(organization).to respond_to(:agreement_eight)
    end
  end



end
