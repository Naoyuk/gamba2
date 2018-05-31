require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      name: "John",
      email: "john@example.com",
    )
    @user.name.upcase
    @user.email.upcase
    @user.save
  end
  # nameとemailがあれば有効な状態であること
  it "is valid with a name and email" do
    expect(@user).to be_valid
  end

  # nameがなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new(
      name: nil,
    )
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  # emailがなければ無効な状態であること
  it "is invalid without an email" do
    user = User.new(
      email: nil,
    )
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # nameが重複するユーザーは無効な状態であること
  it "is invalid with a duplicate name" do
    user = User.new(
      name: "John",
    )
    user.name.upcase
    user.valid?
    expect(user.errors[:name]).to include("has already been taken")
  end

  # emailが重複するユーザーは無効な状態であること
  it "is invalid with a duplicate email" do
    user = User.new(
      email: "john@example.com",
    )
    user.email.upcase
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
