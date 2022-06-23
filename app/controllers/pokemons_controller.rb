class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end
	
  def search
   @pokemons = Pokemon.all
   @pokemon_answer = []
   @pokemons = Pokemon.search(params[:search])
   @pokemon_answer.push(@pokemons)
  end
end
      
