Rails.application.routes.draw do
  get 'admins/login'
  devise_for :admins
  resources :employees
  resources :branches
  resources :records
  resources :roles
  get '/employees/:id/change_status', to: "employees#update_status", as: "status_employee"
  patch '/branches/filter', to: "branches#attendance_branch", as: "filter"
  root 'records#new'
end
