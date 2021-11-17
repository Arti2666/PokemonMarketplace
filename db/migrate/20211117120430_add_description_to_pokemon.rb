class AddDescriptionToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :description, :string
  end
end
