Rails.application.routes.draw do
  root 'static_pages#home'
  resources 'gossips', only: [:new, :create, :show, :index, :edit, :update, :destroy]
  resources 'registrations', only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
