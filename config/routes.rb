Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :search_queries

  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :search_queries, only: [:show, :create] do
        resources :keyword_search_results, only: [:show]
      end
    end
  end

  get "search_queries/:search_query_id/keyword_search_results/:id", to: "api/v1/keyword_search_results#show", as: "keyword_search_result"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
