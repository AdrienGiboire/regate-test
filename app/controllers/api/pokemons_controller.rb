class Api::PokemonsController < ApplicationController
  def index
    render json: Pokemon.all, include: ['types']
  end

  def show
    render json: Pokemon.find(params[:id]), include: ['types']
  end
end
