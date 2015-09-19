require 'rails_helper'

feature "user signs up for an account" do
  scenario 'with valid attributes' do
    visit '/signup'
    fill_in "Name", with: "Jeff"
    fill_in "User name", with: "Jdog"
    fill_in "Password", with: "password"
    fill_in "Email", with: "email@stuff.com"
    click_on "Create Account"
    expect(current_path).to eq(user_path(1))
    expect(page).to have_content("Jeff")
  end

  scenario 'logs in with an existing account' do
    visit new_user_path
    fill_in "Name", with: "Jeff"
    fill_in "User name", with: "Jdog"
    fill_in "Password", with: "password"
    fill_in "Email", with: "email@stuff.com"
    click_on "Create Account"
    visit root_path
    click_link "Login"
    expect(current_path).to eq(login_path)
    fill_in "User name", with: "Jdog"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(current_path).to eq(user_path(1))
  end

  scenario 'logs out' do
    visit new_user_path
    fill_in "Name", with: "Jeff"
    fill_in "User name", with: "Jdog"
    fill_in "Password", with: "password"
    fill_in "Email", with: "email@stuff.com"
    click_on "Create Account"
    visit root_path
    click_link "Login"
    expect(current_path).to eq(login_path)
    fill_in "User name", with: "Jdog"
    fill_in "Password", with: "password"
    click_button "Login"
    expect(current_path).to eq(user_path(1))
    click_button "Logout"
    save_and_open_page
  end

  xscenario 'signs up with name that already exists' do
  end

  xscenario 'user password is too short' do
  end
end


# describe User do
#   let (:valid_attributes) {
#     {name: "clarence", email: "clarence@example.com", password: "number1"}
#   }
#   let(:user) {
#     User.create(valid_attributes)
#   }
#
#   it "has a name" do
#     expect(user.name).to eq("clarence")
#   end
#
#   it "has an email" do
#     expect(user.email).to eq("clarence@example.com")
#   end
#
#   it "has a password"
#     expect(user.authenticate("wrong_password").to eq(false))
#     expect(user.authenticate("number1").to eq(user))
#   end


#### rspec feature tests use feature do/end wrapped around scenario do/end tests

## model test use describe and it
