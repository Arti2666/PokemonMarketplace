require "open-uri"
require "nokogiri"

class PokemonsController < ApplicationController
  attr_accessor :description

  def index
    @pokemons = policy_scope(Pokemon)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
    @seller = User.find(@pokemon.user_id)
    authorize @pokemon
  end

  def new
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(poke_params)
    authorize @pokemon
    scrape_pokemon
    @pokemon.user = current_user

    if @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(poke_params)
    redirect_to pokemon_path(@pokemon)
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
    if @pokemon.destroy
      redirect_to pokemons_path
    end
  end

  private

  # Scraper
  def scrape_pokemon
    url = "https://www.pokemon.com/us/pokedex/#{@pokemon.name}"
    doc = Nokogiri::HTML(URI.open(url, "Accept-Language" => "en-US").read)
    image = doc.search('img.active').attribute('src').value
    description = doc.search('p.version-x').first.text.strip
    @pokemon.image = image
    @pokemon.description = description
    @pokemon.type1 = doc.search('.dtm-type ul li').first.text.strip
    type2li = doc.search('.dtm-type ul li.middle').first

    if type2li.nil?
      @pokemon.type2 = ""
    else
      @pokemon.type2 = type2li.text.strip
    end
  end

  def poke_params
    params.require(:pokemon).permit(:name, :price)
  end
end
