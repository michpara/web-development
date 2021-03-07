Rails.application.routes.draw do
  resources :users, only: [:create, :new, :update, :edit]
end
