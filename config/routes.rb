Rails.application.routes.draw do
  root 'home#show'
  resources :favourite_movies, only: %i[index create]
end
