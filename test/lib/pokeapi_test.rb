require "test_helper"
require 'pokeapi'

class PokeapiApiResourceTest < ActiveSupport::TestCase
  test "Resource#request" do
    VCR.use_cassette("pokeapi_resource_request") do
      response = Pokeapi::Resource.request 'pokemon'
      assert :success
      assert response["count"] > 0
    end
  end

  test "Resource#get(params) throws an error" do
    VCR.use_cassette("pokeapi_resource_get") do
      assert_raises StandardError do
        response = Pokeapi::Resource.get 'pokemon'
      end
    end
  end

  test "Resource#get_all throws an error" do
    VCR.use_cassette("pokeapi_resource_get_all") do
      assert_raises StandardError do
        response = Pokeapi::Resource.get_all
      end
    end
  end
end

class PokeapiApiPokemonTest < ActiveSupport::TestCase
  test "Pokemon#get_all retrieves a list of pokemons from API" do
    VCR.use_cassette("pokeapi_pokemon_get_all") do
      response = Pokeapi::Pokemon.get_all
      assert :success
    end
  end

  test "Resource#get_all throws an error" do
    VCR.use_cassette("pokeapi_resource_get_1") do
      response = Pokeapi::Pokemon.get '1'
      assert response["id"] == 1
    end
  end
end
