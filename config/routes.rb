Rails.application.routes.draw do
  root 'home#show'
  resources :favourite_movies, only: [:create]
end
