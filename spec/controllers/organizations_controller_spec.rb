require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  describe "a non logged in user" do

    # these do not work
    it "redirects them to the login screen" do

      get :resources, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)

      delete :destroy, params: {id: 'FAKE'}
      expect(response).to redirect_to(new_user_session_path)

    end

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

end
