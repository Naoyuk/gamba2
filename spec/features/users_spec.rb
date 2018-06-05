require 'rails_helper'

RSpec.feature "Users", type: :feature do
  # ログインしていないユーザーがルートパスを訪れるとログインフォームがある
  scenario "user not logged in vsits root see log in form." do
    visit root_path
    expect(page).to have_content "Share your climbing!!"
  end

  # Sign Upリンクをクリックすると/signupを表示する
  scenario "click Sign Up link to display the Sign Up page" do
    visit root_path
    click_link "Sign up now!"
    expect(page).to have_content "Register"
  end

  # ユーザーが削除されると、そのユーザーのポストもすべて削除される
  scenario "user's posts are deleted when the user is deleted" do
    user = FactoryGirl.create(:user)
    region = FactoryGirl.create(:region)
    crag = FactoryGirl.create(:crag)
    area = FactoryGirl.create(:area)
    route = FactoryGirl.create(:route)
    user.posts.create(
      region_id: region.id,
      crag_id: crag.id,
      area_id: area.id,
      route_id: route.id,
      result:"send",
      day:"2018-06-01",
      caption:"test"
    )
    expect{user.destroy}.to change{Post.count}.by(-1)
  end

end
