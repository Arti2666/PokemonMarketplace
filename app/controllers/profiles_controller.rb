class ProfilesController < ApplicationController

  def my_profile
    # authorize :profile, :show?
    skip_authorization
    @user = current_user
    @users = User.all
    @bookings = Booking.where(user_id: current_user.id)
    @pokemons = Pokemon.where(user_id: current_user.id)
  end



end
