require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    it 'has a organizations' do
        resourceCategory = ResourceCategory.new
        expect(resourceCategory).to respond_to(:organizations)
    end 

    it 'has a tickets' do
        resourceCategory = ResourceCategory.new
        expect(resourceCategory).to respond_to(:tickets)
    end 

    it 'has a name' do
        resourceCategory = ResourceCategory.new
        expect(resourceCategory).to respond_to(:name)
    end 

    describe "resource_category" do
        it {should have_and_belong_to_many(:organizations)}

        it {should have_many(:tickets)}
    end

    it {should validate_presence_of(:name)}
    it {should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)}
    it {should validate_uniqueness_of(:name).case_insensitive()}

    it "#activate" do 
        resource_categories= ResourceCategory.new
        resource_categories.activate
        expect(resource_categories.active).to eq(true);
    end 

    it "#deactivate" do 
        resource_categories= ResourceCategory.new
        resource_categories.deactivate
        expect(resource_categories.active).to eq(false);
    end 

    describe "#inactive?" do
        it 'returns false if active' do 
            resource_categories= ResourceCategory.new
            resource_categories.active=true
            expect(resource_categories.inactive?).to eq(false);
        
        end
        it 'returns true if inactive' do 
            resource_categories= ResourceCategory.new
            resource_categories.active=false
            expect(resource_categories.inactive?).to eq(true);
        end
    end
    
    it '#to_s' do 
        resourceCategory = ResourceCategory.new
        expect(resourceCategory.name).to eq(resourceCategory.to_s());
    end 

end
