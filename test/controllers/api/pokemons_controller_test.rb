require "test_helper"

class Api::PokemonsControllerTest < ActionDispatch::IntegrationTest
  def setup
    create(:pokemon)
    create(:pokemon)
  end

  test "index responds successfully" do
    get api_pokemons_path
    assert :success

    assert_routing api_pokemons_path, controller: 'api/pokemons', action: 'index'
  end

  test "index lists all pokemons" do
    get api_pokemons_path

    assert_equal JSON.parse(response.body).count, Pokemon.count
  end

  test "show responds successfully" do
    get api_pokemon_show_path(1)
    assert :success

    assert_routing api_pokemon_show_path(1), controller: 'api/pokemons', action: 'show', id: '1'
  end

  test "show retrieves details of one pokemon" do
    pokemon = Pokemon.first

    get api_pokemon_show_path(pokemon)

    assert_equal JSON.parse(response.body)["id"], pokemon.id
  end
end
