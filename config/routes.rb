Rails.application.routes.draw do

  devise_for :users

  resources :users

  #companies controller
  get 'show_companies', to: 'companies#index', as: 'companies'
  get 'companies/new', to: 'companies#new', as: 'new_company'
  post 'companies/create', to: 'companies#create', as: 'create_company'
  get 'company/:id', to: 'companies#show', as: 'company'
  get 'company/:id/edit', to: 'companies#edit', as: 'edit_company'
  post 'companies/update_company', to: 'companies#update', as: 'update_company'
  get 'delete_company/:id', to: 'companies#destroy', as: 'delete_company'
  get '/companies', to: 'companies#companies', as: 'companies_report'

  #tasks controller
  get 'tasks/:company_id/new', to: 'tasks#new', as: 'new_task'
  post 'tasks/create', to: 'tasks#create', as: 'create_task'
  get 'tasks/:task_id', to: 'tasks#show', as: 'task'
  post 'tasks/save_time', to: 'tasks#save_time', as: 'save_time'
  delete 'tasks/:task_id/delete', to: 'tasks#destroy'
  get 'recreate_tasks', to: 'tasks#recreate_tasks', as: 'recreate_tasks'
  root 'tasks#index'

end
