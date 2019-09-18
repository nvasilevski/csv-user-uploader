Rails.application.routes.draw do
  resources :clients, only: :index do
    post :upload, on: :collection
  end
end
