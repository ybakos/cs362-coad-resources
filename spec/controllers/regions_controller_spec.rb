require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  describe "a user that is not logged in" do
    it "redirects to the sign-in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path) 
      get :show, params: { id: 'FAKE' }
      expect(response).to redirect_to(new_user_session_path)
      get :create, params: { id: 'FAKE' } 
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params: { id: 'FAKE' } 
      expect(response).to redirect_to(new_user_session_path)
      get :destroy, params: { id: 'FAKE' }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "an unapproved regions user" do
    it "redirects to the sign-in screen" do
      region_user = create(:user)
      region_user.confirm
      sign_in(region_user)
      get :index
      expect(response).to redirect_to(dashboard_path)
      get :new
      expect(response).to redirect_to(dashboard_path) 
      get :show, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
      get :create, params: { id: 'FAKE' } 
      expect(response).to redirect_to(dashboard_path)
      get :edit, params: { id: 'FAKE' } 
      expect(response).to redirect_to(dashboard_path)
      get :destroy, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      patch :update, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)

      put :update, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
      
      delete :destroy, params: { id: 'FAKE' }
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
