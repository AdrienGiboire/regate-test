class Api::PokemonsController < ApplicationController
  def index
    render json: Pokemon.preload(:pokemon_types, :types).all, include: ['types']
  end

  def show
    render json: Pokemon.find(params[:id]), include: ['types']
  end
end
