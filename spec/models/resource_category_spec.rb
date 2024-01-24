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
end
