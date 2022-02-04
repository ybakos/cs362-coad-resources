require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { build(:organization) }
 
  describe "attributes" do
    it "has agreement_one" do
      expect(organization).to respond_to(:agreement_one)
    end
    it "has agreement_two" do
      expect(organization).to respond_to(:agreement_two)
    end
    it "has agreement_three" do
      expect(organization).to respond_to(:agreement_three)
    end
    it "has agreement_four" do
      expect(organization).to respond_to(:agreement_four)
    end
    it "has agreement_five" do
      expect(organization).to respond_to(:agreement_five)
    end
    it "has agreement_six" do
      expect(organization).to respond_to(:agreement_six)
    end
    it "has agreement_seven" do
      expect(organization).to respond_to(:agreement_seven)
    end
    it "has agreement_eight" do
      expect(organization).to respond_to(:agreement_eight)
    end
  end

  describe "methods" do
    it "has a status that can be changed to approved" do
      expect(organization.status.to_s).to_not eq(:approved.to_s)
      organization.approve
      expect(organization.status.to_s).to eq(:approved.to_s)
    end
    it "has a status that can be changed to rejected" do
      expect(organization.status.to_s).to_not eq(:rejected.to_s)
      organization.reject
      expect(organization.status.to_s).to eq(:rejected.to_s)
    end
    describe "set_default_status" do
      it "can change a nil status to a submitted status" do
        organization.status = nil
        organization.set_default_status
        expect(organization.status.to_s).to eq(:submitted.to_s)
      end
      it "can change a false status to a submitted status" do
        organization.status = false 
        organization.set_default_status
        expect(organization.status.to_s).to eq(:submitted.to_s)
      end
      it "can not change an existing status" do
        status = :approved
        organization.status = status
        organization.set_default_status
        expect(organization.status.to_s).to eq(status.to_s)
      end
    end
  end

end
