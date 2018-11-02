Rails.application.routes.draw do
  root 'registrations#new'
  resources 'registrations', only: [:new, :create] do
     resources 'gossips', only: [:new, :create, :show, :index, :edit, :update, :destroy] do 
        resources 'comments', only: [:new, :create, :show, :edit, :update, :destroy, :show] 
        resources 'likes', only: [:new, :create, :show, :edit, :update, :destroy, :show]
     end 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
