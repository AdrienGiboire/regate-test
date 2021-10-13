class Api::PokemonsController < ApplicationController

  swagger_controller :pokemons, "Pokemons"

  swagger_api :index do
    summary "To list pokemons"
    response :success
    response 500, "Internal Error"
  end
  def index
    render json: Pokemon.preload(:pokemon_types, :types).all, include: ['types']
  end

  swagger_api :show do
    summary "To view the detail of a pokemon"
    param :id, :integer, :required, "ID of the pokemon"
    response :success
    response :not_found
    response 500, "Internal Error"
  end
  def show
    begin
      pokemon = Pokemon.find(params[:id])

      render json: pokemon, include: ['types']
    rescue
      render json: :not_found, status: :not_found
    end
  end
end
