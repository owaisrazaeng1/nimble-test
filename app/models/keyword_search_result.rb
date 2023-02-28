class KeywordSearchResult < ApplicationRecord
  validates :query, presence: true
  belongs_to :search_query
  after_create :scrap_data

  private

  def scrap_data
    data = Scraper::GoogleScraperService.new(keyword: self.query).call
    self.update!(data)
  end
end
