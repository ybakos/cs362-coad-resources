require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  describe "a non logged in user" do

    it "redirects them to the login screen" do

      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)

      post :approve, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      post :reject, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)
      post :create
      expect(response).to redirect_to(new_user_session_path)

      patch :update, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)

      put :update, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)

    end

  end

  describe "a logged-in, non-admin user" do

    let(:user) { create(:user_with_organization) }

    before do
      user.confirm
      sign_in(user)
      user.organization.approve
    end

    it "redirects user with organization to dashboard" do

      get :new
      expect(response).to redirect_to(dashboard_path)
      get :create
      expect(response).to redirect_to(dashboard_path)

      post :approve, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)
      post :reject, params: {id: 'FAKE'}
      expect(response).to redirect_to(dashboard_path)


    end

  end

end
