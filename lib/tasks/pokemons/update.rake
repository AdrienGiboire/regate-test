require 'pokeapi'

namespace :pokemons do
  task update: :environment do
    pokemons = Pokeapi::Pokemon.get_all

    pokemons.each do |pokemon|
      HardWorker.perform_async pokemon["url"].split("/").last
    end
  end
end
