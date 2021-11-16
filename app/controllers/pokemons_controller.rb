class PokemonsController < ApplicationController


  def index
    @pokemons = policy_scope(Pokemon)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
    authorize @pokemon
  end

  def new
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(poke_params)
    @pokemon.user = current_user
    authorize @pokemon
    if @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(poke_params)
    redirect_to pokemon_path(@pokemon)
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.destroy
      redirect_to pokemons_path
    end
  end

  private

  def poke_params
    params.require(:pokemon).permit(:name, :price)
  end
end
