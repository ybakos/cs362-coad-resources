require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
    describe "test full_title" do
        it "given no title" do 
            expect(helper.full_title()).to eq'Disaster Resource Network' 
        end 
        it "given a title " do 
            expect(helper.full_title('test title')).to eq("test title | Disaster Resource Network") 
        end 
    end
end
