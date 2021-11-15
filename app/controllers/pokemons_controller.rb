class PokemonsController < ApplicationController


  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(poke_params)
    @pokemon.user = current_user
    if @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(poke_params)
    redirect_to pokemon_path(@pokemon)
  end

  private

  def poke_params
    params.require(:pokemon).permit(:name)
  end
end
