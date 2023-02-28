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
      url = "https://www.google.com/search?q=#{query[:keyword]}"
      uri = URI.parse(url)

      response = Net::HTTP.get_response(uri)
      code = response.body
      {
        advertisors_count: 5,
        links_count: 4,
        results_count: 21563200,
        code: code,
      }
    end
  end
end
