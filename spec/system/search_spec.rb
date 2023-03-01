require 'rails_helper'

describe "search", type: :feature do
  before :each do
    User.create(email: 'user1@example.com', password: 'password')
  end

  it "restricts access to search page" do
    visit new_search_query_path
    expect(page).to have_selector(:button, 'Login')
  end

  it "creates keywords after search" do
    visit new_user_session_path
    fill_in 'user_email', with: 'user1@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Login'

    visit new_search_query_path

    attach_file("search_query[file]", "spec/files/sample.csv", visible: false)
    click_button 'Search'

    #all 15 keyword_search_results are created
    expect(KeywordSearchResult.count).to eql(15)
  end
end
