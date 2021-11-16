class AddTypeToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :type, :string
  end
end
