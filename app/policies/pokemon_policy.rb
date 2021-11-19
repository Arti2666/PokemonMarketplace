class PokemonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    @record.user == @user
  end

  def show?
    true
  end

  def destroy?
    true
  end
end

# Pokemon.left_outer_joins(:bookings).select("pokemons.*, bookings.created_at + bookings.amount * 3600 AS END_DATE").distinct.where(bookings: {id: nil}).or(Pokemon.left_outer_joins(:bookings).select("pokemons.*, bookings.created_at + bookings.amount * 3600 AS END_DATE").distinct.where("END_DATE < #{now}")).pluck(:id)

# query = "SELECT * FROM pokemons
#             INNER_JOIN booking ON bookings.pokemon_id = pokemons.id
#             WHERE bookings.id IS NULL
#             OR
#                 bookings.created_at + bookings.amount * 3600 < #{Time.now}
#     "

#     results = ActiveRecord::Base.connection.execute(query)
