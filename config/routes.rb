Yeldango::Application.routes.draw do
  root "homes#show"
  resource :suggestion, only: [:new, :create]
  resource :guest, only: [:create]
end
