require 'spec_helper'

describe User do

  before do
    @user = new_user
    expect(@user).to be_valid
  end

  it "email can't be blank" do
    @user.email = " "
    expect(@user).to_not be_valid
  end

  it "wedding password must be correct" do
    user = new_user(wedding_password: "ellieandnick")
    expect(user).to_not be_valid
  end

  it "password can't be blank" do
    @user.password = ""
    @user.password_digest = ""
    expect(@user).to_not be_valid
  end

  it "password must be at least 8 characters" do
    @user.password = "hello12"
    expect(@user).to_not be_valid
  end

  it "email must be unique" do
    @user.save
    user_1 = new_user(:email => 'jake@example.com')
    user_1.save
    expect(user_1).to_not be_valid
  end

end