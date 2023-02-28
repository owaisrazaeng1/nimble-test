class SearchQueriesController < ApplicationController
  before_action :set_query, :only => [:show, :destroy]

  def new
  	redirect_to root_path unless user_signed_in?
  	@search_query = SearchQuery.new
  end

  def create
  	SearchQuery.import(params[:search_query][:file], current_user)
    redirect_to root_path
  end

  def index
  	@queries = current_user.search_queries
  end

  def show
  	@keywords = @query.keyword_search_results
  end

  def destroy
  	if @query.destroy
  	  redirect_to search_queries_path
  	end
  end

  private

  def set_query
  	@query = SearchQuery.find_by(id: params[:id])
  end
end
