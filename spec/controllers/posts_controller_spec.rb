require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    # 正常にレスポンスを返すこと
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    # 200レスポンスを返すこと
    it "responds successfully" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  # 新しいPostから順に表示されていること
  #it "orders most recent" do
  #  post1 = FactoryGirl.create(:post, created_at: "2018-05-31 10:00:00")
  #  post2 = FactoryGirl.create(:post, created_at: "2018-05-31 09:58:00")
  #  post3 = FactoryGirl.create(:post, created_at: "2018-06-01 09:00:00")
  #end
end
