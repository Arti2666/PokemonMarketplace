class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pokemons
  has_many :bookings

  has_many :pokemon_rented, through: :bookings, source: :pokemon
end

# all your pokemons
# def pokemons
# end

# all the pokemons you've booked
# def pokemon_rented
# end
