Rails.application.routes.draw do
  get 'admins/login'
  devise_for :admins
  resources :employees
  resources :branches do
    member do
      get :filter
    end
  end
  resources :records
  get '/employees/:id/change_status', to: "employees#update_status", as: "status_employee"
  root 'records#new'
end
