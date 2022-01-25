require 'rails_helper'

RSpec.describe Region, type: :model do
    describe 'methods' do
        it 'returns its name from to_s' do
            region = Region.new
            region_name = 'hai'
            region.name = region_name
            expect(region.to_s).to eq(region_name)
        end
        
        it 'creates region with name if it doesnt previously exist' do
            region = Region.find_or_create_by(name: 'Unspecified')
            expect(region.name).to eq('Unspecified')
        end
    end
end
