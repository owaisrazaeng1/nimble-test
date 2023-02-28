require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  describe "checks validation" do
    it "should be invalid" do
      user = User.create(first_name: "Harry", last_name: "Potter", email: "hp@gmail.com", password: "Admin@123")
      invalid_search_query = SearchQuery.new(user_id: user.id)
      expect(invalid_search_query.valid?).to eq(false)
    end

    it "should be valid" do
      user = User.create(first_name: "Harry", last_name: "Potter", email: "hp1@gmail.com", password: "Admin@123")
      valid_search_query = SearchQuery.new(user_id: user.id, keywords:["car", "bus", "train"])
      expect(valid_search_query.valid?).to eq(true)
    end
  end
end
