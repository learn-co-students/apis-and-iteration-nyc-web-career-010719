require 'rest-client'
require 'json'
require 'pry'

def get_response(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = get_response('http://www.swapi.co/api/people/')

  character = response_hash["results"].find do |results_hash|
    results_hash["name"] == character_name
  end

  character["films"].map do |url|
    get_response(url)
  end
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.map do |film|
    puts film["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

# binding.pry
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
