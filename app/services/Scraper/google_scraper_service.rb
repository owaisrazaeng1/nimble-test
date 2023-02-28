module Scraper
  class GoogleScraperService
    attr_accessor :query

    def initialize(query)
      @query = query
    end

    def call
      scrap_data(query)
    end

    private

    def scrap_data(query)
      code = "<html><head><title></title></head><body>#{query[:keyword]}</body><html>"
      {
        advertisors_count: 5,
        links_count: 4,
        results_count: 21563200,
        code: code,
      }
    end
  end
end
