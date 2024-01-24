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
    it 'to_s works' do 
        user= User.new
        expect(user.email).to eq(user.to_s());
    end 

   

    it 'set_defult_role works 'do
        user = User.new
        user.set_default_role
        expect(user.role).to eq("organization")
    end

end
