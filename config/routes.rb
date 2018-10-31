Rails.application.routes.draw do

  get 'gossips/new'
  root 'static_pages#home'
  resources 'gossips', only: [:new, :create, :show, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
