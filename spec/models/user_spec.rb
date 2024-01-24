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
        it { should belong_to(:organization).optional}
    end

    it {should validate_presence_of(:email)}
    it {should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)}
    it {should have_attribute(:email)}
    it {should validate_uniqueness_of(:email).case_insensitive()}

    it{should validate_presence_of(:password).on(:create)}
    it{should validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)}

    it '#set_defult_role'do
    user = User.new
    user.set_default_role
    expect(user.role).to eq("organization")
    end

    it '#to_s' do 
        user= User.new
        expect(user.email).to eq(user.to_s());
    end 

end
