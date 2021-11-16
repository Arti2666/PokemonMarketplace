class AddPriceToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :price, :integer
  end
end
