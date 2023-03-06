class SearchQueriesController < ApplicationController
  before_action :set_query, :only => [:show, :destroy]
  before_action :authenticate_user!

  def new
  	@search_query = SearchQuery.new
  end

  def create
    unless SearchQuery.import(params[:search_query][:file], current_user)
      flash[:warning] = 'Please enter less than 100 keywords.'
    end
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
