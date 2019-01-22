require 'rest-client'
require 'json'
require 'pry'

def find_character(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_hash = response_hash["results"].find { |character| character["name"] == character_name }
end

def character_film(films)
  films.map do |film|
    response_film = RestClient.get(film)
    film_hash = JSON.parse(response_film)
  end
end

def get_character_movies_from_api(character_name)
  #make the web request
  # response_string = RestClient.get('http://www.swapi.co/api/people/')
  # response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  # gives us luke skywalker but will remove first
  # character_hash = response_hash["results"].find { |character| character["name"] == character_name }
  # # binding.pry
  # films = character_hash["films"]
  # film_data = films.map do |film|
  #   response_film = RestClient.get(film)
  #   film_hash = JSON.parse(response_film)
  # end
  # film_data
  ###########
  # find_character(character_name)
  films = find_character(character_name)["films"]
  character_film(films)
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each { |film| puts film["title"] }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
