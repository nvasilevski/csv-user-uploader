Rails.application.routes.draw do
  resources :clients, only: %i(index update) do
    post :upload, on: :collection
  end
end
