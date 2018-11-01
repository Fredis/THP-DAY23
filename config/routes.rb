Rails.application.routes.draw do
  root 'static_pages#home'
  resources 'registrations', only: [:new, :create] do
     resources 'gossips', only: [:new, :create, :show, :index, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
