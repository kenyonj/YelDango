Yeldango::Application.routes.draw do
  root "homes#show"
  resources :suggestions, only: [:new, :create, :edit, :update]
  resource :guest, only: [:create]


end
