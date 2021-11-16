class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pokemon = Pokemon.find(params[:pokemon_id])
    if @booking.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:price)
  end
end
