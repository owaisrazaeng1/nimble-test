require 'csv'

class SearchQuery < ApplicationRecord
  belongs_to :user
  has_many :keyword_search_results, dependent: :destroy
  validates :keywords, presence: true
  after_commit :create_keyword_search_results, on: :create

  def self.import(file, user)
    keywords = []
    CSV.foreach(file.path, headers: true) do |row|
      keywords << row[0]
    end
    search_query = SearchQuery.new(user_id: user.id)
    search_query.keywords = keywords
    search_query.save
  end

  private

  def create_keyword_search_results
    self.keywords.each do |keyword|
      KeywordSearchResult.create!(search_query: self, query: keyword)
    end
  end
end
