require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#profile" do
    # 正常にレスポンスを返すこと
    it "responds successfully" do
      get :profile
      expect(response).to be_success
    end

    # 200レスポンスを返すこと
    it "responds successfully" do
      get :profile
      expect(response).to have_http_status "200"
    end
  end
end
