Rails.application.routes.draw do
  root 'movies#new'
  resources :movies
end
