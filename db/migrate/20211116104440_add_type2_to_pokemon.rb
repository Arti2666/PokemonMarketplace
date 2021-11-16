class AddType2ToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :type2, :string, default: ""
    rename_column :pokemons, :type, :type1
  end
end
