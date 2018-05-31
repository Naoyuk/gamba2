require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      name: "John",
      email: "john@example.com",
      password: "password",
      password_confirmation: "password",
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

  # emailのフォーマットが正しくない場合は無効な状態であること
  it "is invalid with a wrong format email" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).not_to be_valid
    end
  end

  # emailのフォーマットが正しい場合は有効な状態であること
  it "is valid with a right format email" do
    addresses = %w[user@example.com user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  # passwordが6文字未満の場合は無効な状態であること
  it "is invalid with a password shorter than 5 letters" do
    user = User.new(
      name: "Alex",
      email: "alex@example.com",
      password: "a" * 5,
      password_confirmation: "a" * 5,
    )
    expect(user).not_to be_valid
  end

  # passwordが6文字の場合は有効な状態であること
  it "is invalid with a 6 letters password" do
    user = User.new(
      name: "Alex",
      email: "alex@example.com",
      password: "a" * 6,
      password_confirmation: "a" * 6,
    )
    expect(user).to be_valid
  end

  # passwordがブランクであれば無効な状態であること
  it "is invalid with a blank password" do
    user = User.new(
      name: "Alex",
      email: "alex@example.com",
      password: " " * 6,
      password_confirmation: " " * 6,
    )
    expect(user).not_to be_valid
  end
end
