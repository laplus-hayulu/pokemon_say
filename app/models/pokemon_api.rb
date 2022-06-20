class PokemonApi
  def self.to_json
    pokemons = []

    response = Faraday.get "https://pokeapi.co/api/v2/pokemon-species?limit=151&offset=0"
    response = JSON.parse(response.body)
    response.each do |k, value|
      if k == "results"
        value.each do |key, val|
          response = Faraday.get(key["url"])
          response = JSON.parse(response.body)
          pokemons.push(response)
        end
      end
    end

    pokemons.map do |poke|
      Pokemon.create(
        # img:poke['sprites']['other']['dream_world']["front_default"],
        name: poke['names'][0]['name'],
        # poke_type: poke['types'][0]['type']['name'], 
        # ability: poke['abilities'][0]['ability']['name'], 
        id: poke['id']
      )
    end
  end
end
