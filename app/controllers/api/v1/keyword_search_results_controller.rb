module Api
  module V1
    class KeywordSearchResultsController < ApplicationController
      def show
        query = SearchQuery.find_by(id: params[:search_query_id])
        keyword = query.keyword_search_results.find_by(id: params[:id])
        response = {
          query:keyword.query,
          advertisors_count:keyword.advertisors_count,
          links_count:keyword.links_count,
          results_count:keyword.results_count,
          code:keyword.code,
        }
        respond_to do |format|
          format.json { render json: {keyword_search_result:response, status: "OK"} }
          format.html { @keyword_search_result = keyword }
        end
      end
    end
  end
end

