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
      uri = URI.open(url)

      response = Nokogiri::HTML(uri)
      data = response.css('body').to_s
      data = data.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
      code = data.encode!('UTF-8', 'UTF-16')
      links_count = response.css('a').count
      advertisors_count = response.css('div.v5yQqb').count

      {
        advertisors_count: advertisors_count,
        links_count: links_count,
        results_count: 21563200,
        code: code,
      }
    end
  end
end
