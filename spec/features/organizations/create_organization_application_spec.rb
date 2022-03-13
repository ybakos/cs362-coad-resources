require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  before do
    admin.confirm
    user.confirm
    log_in_as(user)
  end

  it "allows a user to create an organization application" do
    visit new_organization_application_path
    choose('organization_liability_insurance_true')
    choose('organization_agreement_one_true')
    choose('organization_agreement_two_true')
    choose('organization_agreement_three_true')
    choose('organization_agreement_four_true')
    choose('organization_agreement_five_true')
    choose('organization_agreement_six_true')
    choose('organization_agreement_seven_true')
    choose('organization_agreement_eight_true')
    
    fill_in('organization_primary_name', :with => 'LastName, FirstName')
    fill_in('organization_name', :with => 'System Test Organization')
    fill_in('organization_title', :with => 'FakeTitle')
    fill_in('organization_phone', :with => '+15413334343')
    fill_in('organization_secondary_name', :with => 'Other Organization')
    fill_in('organization_secondary_phone', :with => '+15414443434')
    fill_in('organization_email', :with => 'fakeemail@gmail.com')
    fill_in('organization_description', :with => 'Lorem ipsum se dolor')

    choose('organization_transportation_yes')

    click_on 'Apply'

    expect(page).to have_content("Thank you for applying.")
  end
end
