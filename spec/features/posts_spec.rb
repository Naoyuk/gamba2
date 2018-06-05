require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  # ユーザーはログイン後に新しい投稿をポストできる
  scenario "user after log in posts a new post"

  describe "#index" do
    # ユーザーはログインするとポストの一覧が見える
    scenario "user logged in can see posts" do
      region = FactoryGirl.create(:region)
      crag = FactoryGirl.create(:crag)
      area = FactoryGirl.create(:area)
      route = FactoryGirl.create(:route)
      post = FactoryGirl.create(:post)
      visit root_path
      visit login_path
      fill_in "E-mail", with: 'john@example.com'
      fill_in "Password", with: 'password'
      click_button 'Login'
      expect(page).to have_content "Favs"
      expect(page).to have_content "Comments"
    end
  end
end
