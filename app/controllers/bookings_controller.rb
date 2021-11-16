class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create # rubocop:disable all
    @booking = Booking.new
    @booking.user = current_user
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking.pokemon = @pokemon
    @booking.price = @pokemon.price
    if @booking.save
      @pokemon.reserved = true
      @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end
end
