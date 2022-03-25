Rails.application.routes.draw do
  resources :employees
  resources :branches
  resources :records
  get '/employees/:id/change_status', to: "employees#update_status", as: "status_employee"

  root 'records#new'
end
