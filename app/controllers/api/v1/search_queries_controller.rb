module Api
  module V1
    class SearchQueriesController < ApplicationController
      protect_from_forgery with: :null_session
      def create
        user = User.find_by(id: params[:user_id])
      	SearchQuery.import(params[:file], user)
        respond_to do |format|
          format.json { render json: {status: "OK"} }
        end
      end

      def show
        search_query = SearchQuery.find_by(id: params[:id])
        respond_to do |format|
          format.json { render json: {keywords:search_query.keywords, status: "OK"} }
        end
      end
    end
  end
end

