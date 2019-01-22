require 'rest-client'
require 'json'
require 'pry'

def get_results(subject)
  response_string = RestClient.get("http://www.swapi.co/api/#{subject}/")
  response_hash = JSON.parse(response_string)
  results = response_hash["results"]
  results
end

def get_character_movies_from_api(character_name)
  #make the web request
  results = get_results("people")
  character = results.find {|result| result["name"].downcase == character_name}
  films = character["films"].map {|url| JSON.parse(RestClient.get(url))}
  films
  # binding.pry
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

def get_film_info_from_film_name(film)
  #make the web request
  results = get_results("films")
  film_info = results.find {|result| result["title"].downcase == film}
  title,oc,director,producer = film_info.values_at("title","opening_crawl","director","producer")
  film_info_array = ["####=---------------", title, oc, director, producer, "####=---------------"]
  film_info_array
end


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each_with_index {|val, index| puts "#{index+1} #{val["title"]}"}
end

def print_film_info(film_info)
  # some iteration magic and puts out the movies in a nice list
  film_info.each {|val| puts "#{val}"}
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

def show_film_info(film)
  film_info = get_film_info_from_film_name(film)
  print_film_info(film_info)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
