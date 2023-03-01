require 'rails_helper'

describe "user", type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it "creates new user" do
    visit new_user_registration_path

    fill_in "user_first_name", with: "Harry"
    fill_in "user_last_name", with: "Potter"
    fill_in "user_email", with: "hp2@gmail.com"
    fill_in "user_password", with: "Admin@123"
    fill_in "user_password_confirmation", with: "Admin@123"


    click_button 'Sign up'
    expect(page).to have_content 'Sign Out'
  end

  it "signs me in" do
    visit new_user_session_path

    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'

    click_button 'Login'
    expect(page).to have_content 'Sign Out'
  end
end
