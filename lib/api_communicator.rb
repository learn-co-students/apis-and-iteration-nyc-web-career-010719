require 'rest-client'
require 'json'
require 'pry'

def get_movie_info(film_url)
  film_url.collect do |movie_info|
    JSON.parse(RestClient.get(movie_info))
  end
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  # iterate over the response hash to find the collection of `films` for the given
  found_character = response_hash["results"].find { |character_data| character_data["name"].downcase == character_name.downcase }
  film_url = found_character["films"]
  get_movie_info(film_url)
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each.with_index(1) do |film_data, index|
    puts "#{index} #{film_data['title']}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

#binding.pry
