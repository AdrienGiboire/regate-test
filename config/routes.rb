require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  get '/api/pokemons', to: 'api/pokemons#index'
  get '/api/pokemons/:id', to: 'api/pokemons#show', as: :api_pokemon_show
end
