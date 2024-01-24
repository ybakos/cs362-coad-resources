require 'rails_helper'

RSpec.describe User, type: :model do
    it 'has a email' do
        user = User.new
        expect(user).to respond_to(:email)
    end
    
    it 'has a role' do
        user = User.new
        expect(user).to respond_to(:role)
    end 

    describe "user" do
        it { should belong_to(:organization)}
    end   
end
