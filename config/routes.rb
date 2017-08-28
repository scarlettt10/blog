Rails.application.routes.draw do
root 'pages#index'
# CRUD - Create Read Update Delete
resources :pages
end
