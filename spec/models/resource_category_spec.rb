require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:resource_category) {build(:resource_category, :name => 'first fake')}

    it 'has a organizations' do
        expect(resource_category).to respond_to(:organizations)
    end 

    it 'has a tickets' do
        expect(resource_category).to respond_to(:tickets)
    end 

    it 'has a name' do
        expect(resource_category).to respond_to(:name)
    end 

    describe "resource_category" do
        it {should have_and_belong_to_many(:organizations)}

        it {should have_many(:tickets)}
    end

    it {should validate_presence_of(:name)}
    it {should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)}
    it {should validate_uniqueness_of(:name).case_insensitive()}


    it '#unspecified' do 
        resource_category= ResourceCategory.unspecified
        expect(resource_category.name).to eq("Unspecified");
    end

    it "#activate" do 
        resource_category.activate
        expect(resource_category.active).to eq(true);
    end 

    it "#deactivate" do 
        resource_category.deactivate
        expect(resource_category.active).to eq(false);
    end 

    describe "#inactive?" do
        it 'returns false if active' do 
            resource_category.active=true
            expect(resource_category.inactive?).to eq(false);
        
        end
        it 'returns true if inactive' do 
            resource_category.active=false
            expect(resource_category.inactive?).to eq(true);
        end
    end
    
    it '#to_s' do 
        expect(resource_category.name).to eq(resource_category.to_s());
    end 

end
