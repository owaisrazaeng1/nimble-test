require 'rails_helper'

RSpec.describe "SearchQueries", type: :request do

  # let(:user) { create :user }
  # let!(:device) { create :device, user: user }
  # let!(:temperature) { create :temperature, user: user }

  context "user logged in" do

    before do
      user = User.create(email: 'user@example.com', password: 'password')
      sign_in(user)
    end

    describe "GET /index" do
      it "returns http success" do
        get search_queries_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /show" do
      it "returns http success" do
        search_query = SearchQuery.create(keywords: ["one", "two"], user: User.find_by(email: 'user@example.com'))
        get search_query_path(search_query)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /create" do
      let(:file) { fixture_file_upload('spec/files/sample.csv') }
      it "returns http success" do
        post search_queries_path, params: { "search_query" => { "file" => file } }

        #Page is redirected
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /destroy" do
      it "returns http success" do
        search_query = SearchQuery.create(keywords: ["one", "two"], user: User.find_by(email: 'user@example.com'))
        delete search_query_path(search_query)

        #Page is redirected
        expect(response).to have_http_status(302)
      end
    end
  end
end
