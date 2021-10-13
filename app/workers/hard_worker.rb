class HardWorker
  include Sidekiq::Worker

  def perform id
    data = Pokeapi::Pokemon.get id

    created_pokemon = Pokemon.find_or_create_by(name: data["name"]) do |p|
      p.base_experience = data["base_experience"]
      p.height = data["height"]
      p.is_default = data["is_default"]
      p.order = data["order"]
      p.weight = data["weight"]
    end

    data["types"].map do |item|
      type = Type.find_or_create_by(name: item["type"]["name"])
      created_pokemon.pokemon_types.find_or_create_by(type_id: type.id) do |pt|
        pt.slot = item["slot"]
      end
    end
  end
end
