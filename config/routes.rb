Rails.application.routes.draw do
  resources :employees
  resources :branches

  get '/search', to: 'branches#search'
end
