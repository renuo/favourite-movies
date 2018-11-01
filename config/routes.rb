Rails.application.routes.draw do
  resources :favorite_movies
  root 'home#show'
end
