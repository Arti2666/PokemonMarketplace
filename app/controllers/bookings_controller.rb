class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create # rubocop:disable all
    @booking = Booking.new
    @booking.user = current_user
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking.pokemon = @pokemon
    @booking.amount = params["booking"]["amount"].to_i
    @booking.price = @pokemon.price
    authorize @booking
    if @booking.save
      @pokemon.reserved = true
      @pokemon.save
      redirect_to my_profile_profiles_path
    else
      render :new
    end
  end
end
