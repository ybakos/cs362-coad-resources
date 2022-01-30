require 'rails_helper'

RSpec.describe User, type: :model do

    describe "validations" do
        it "has an email" do
            user = User.new(email: "r@s.org")
            expect(user).to respond_to(:email)
        end
    end

end
