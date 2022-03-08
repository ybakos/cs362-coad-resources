require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  describe "a user that is not logged in" do
    it "redirects to the sign-in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end 
  end
end
