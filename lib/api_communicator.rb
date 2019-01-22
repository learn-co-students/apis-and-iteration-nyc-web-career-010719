require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')

  # puts response_string
  # puts character_data
  character_hash = JSON.parse(all_characters)
  # character_array = .find {| | character}

  while character_hash
    films = character_hash["results"].find do |hash|
      hash["name"].downcase == character
    end

    if films
      return films["films"].map do |film|
        JSON.parse(RestClient.get(film))
      end
    end
    character_hash = character_hash["next"] ? JSON.parse(RestClient.get(character_hash["next"])) : nil
  end
  # iterate over the response hash to find the collection of `films` for the given
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
  # films = get_character_movies_from_api("")
  # binding.pry
  films.each.with_index(1) do |value, index|
    puts "#{index} " + value['title']
  end
  # puts films
end

def show_character_movies(character)
  # binding.pry
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
