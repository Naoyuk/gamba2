require 'rails_helper'

RSpec.describe Post, type: :model do
  # FactoryGirlで作成したPostが有効であること
  it "is valid with a post made by FactoryGirl" do
    post = FactoryGirl.create(:post)
    expect(post).to be_valid
  end

  # user_idがなければ無効な状態であること
  it "is invalid without a user_id" do
    post = FactoryGirl.build(:post, user_id: nil)
    post.valid?
    expect(post.errors[:user_id]).to include("can't be blank")
  end

  # region_idがなければ無効な状態であること
  it "is invalid without a region_id" do
    post = FactoryGirl.build(:post, region_id: nil)
    post.valid?
    expect(post.errors[:region_id]).to include("can't be blank")
  end

  # crag_idがなければ無効な状態であること
  it "is invalid without a crag_id" do
    post = FactoryGirl.build(:post, crag_id: nil)
    post.valid?
    expect(post.errors[:crag_id]).to include("can't be blank")
  end

  # area_idがなければ無効な状態であること
  it "is invalid without a area_id" do
    post = FactoryGirl.build(:post, area_id: nil)
    post.valid?
    expect(post.errors[:area_id]).to include("can't be blank")
  end

  # route_idがなければ無効な状態であること
  it "is invalid without a route_id" do
    post = FactoryGirl.build(:post, route_id: nil)
    post.valid?
    expect(post.errors[:route_id]).to include("can't be blank")
  end

  # dayがなければ無効な状態であること
  it "is invalid without a day" do
    post = FactoryGirl.build(:post, day: nil)
    post.valid?
    expect(post.errors[:day]).to include("can't be blank")
  end

  # resultがなければ無効な状態であること
  it "is invalid without a result" do
    post = FactoryGirl.build(:post, result: nil)
    post.valid?
    expect(post.errors[:result]).to include("can't be blank")
  end

  # captionがなければ無効な状態であること
  it "is invalid without a caption" do
    post = FactoryGirl.build(:post, caption: nil)
    post.valid?
    expect(post.errors[:caption]).to include("can't be blank")
  end

  # captionがなければ無効な状態であること(空白スペースのみの場合も無効とする)
  it "is invalid with a white spaces caption" do
    post = FactoryGirl.build(:post, caption: " " * 5)
    post.valid?
    expect(post.errors[:caption]).to include("can't be blank")
  end
end
