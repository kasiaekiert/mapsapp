require 'rails_helper'

RSpec.describe "Main page", type: :request do
  describe "GET /places" do
    it "if you go to main page you have to sign in" do
      get places_path
      expect(response).to redirect_to('/users/sign_in')
    end
  end
end
