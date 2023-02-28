require 'rails_helper'

RSpec.describe KeywordSearchResult, type: :model do
  describe "checks validation" do
    it "should be invalid" do
      user = User.create(first_name: "Harry", last_name: "Potter", email: "hp@gmail.com", password: "Admin@123")
      search_query = SearchQuery.new(user_id: user.id, keywords:["car", "bus", "train"])
      keyword = KeywordSearchResult.new(search_query: search_query)
      expect(keyword.valid?).to eq(false)
    end

    it "should be valid" do
      user = User.create(first_name: "Harry", last_name: "Potter", email: "hp1@gmail.com", password: "Admin@123")
      search_query = SearchQuery.new(user_id: user.id, keywords:["car", "bus", "train"])
      keyword = KeywordSearchResult.new(search_query: search_query, query: search_query.keywords[0])
      expect(keyword.valid?).to eq(true)
    end
  end
end
