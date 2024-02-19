require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do

    describe "dashboard_for" do 
        it "#admin" do 
            user = double('user', admin?:true ,organization:nil)
            expect(helper.dashboard_for(user)).to eq('admin_dashboard') 
        end     
        it "#org submited "do 
        user=double('user', admin?:false , organization: double( 'Organization',submitted?: true , approved?: false) )
            expect(helper.dashboard_for(user)).to eq("organization_submitted_dashboard") 
        end 
        it "#org aproved "do 
        user = double('user', admin?:false , organization: double( 'Organization',submitted?: false, approved?: true) )
            expect(helper.dashboard_for(user)).to eq('organization_approved_dashboard') 
        end 
        it "#not submited or admin" do 
        user = double('user', admin?:false , organization: double( 'Organization',submitted?: false, approved?: false) )
            expect(helper.dashboard_for(user)).to eq('create_application_dashboard')
        end 
    end 
end
