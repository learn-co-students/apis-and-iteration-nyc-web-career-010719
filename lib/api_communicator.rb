require 'rest-client'
require 'JSON'
require 'pry'


def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  results_hash = response_hash["results"]

  # results_hash.find {|character| character["name"][character_name]}["films"].map {|movie| JSON.parse(RestClient.get(movie))}
  character_array = results_hash.find do |character|
    character["name"][character_name]
  end
  films_array = character_array["films"].map do |movie|

    JSON.parse(RestClient.get(movie))
  end



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
  # binding.pry


end

def print_movies(character_name)
  counter = 0
  get_character_movies_from_api(character_name).map do |index|
    counter += 1
    puts "#{counter} #{index["title"]}"
  end

end

# def show_movie_info()
#   response_string = RestClient.get('http://www.swapi.co/api/films/')
#   response_hash = JSON.parse(response_string)
#   films_array = response_hash["results"]
#
#   if film_id_num =
#
# end

# def show_character_movies(character)
#   films_array = get_character_movies_from_api(character)
#   print_movies(films_array)
# end

 # binding.pry


"Luke I am your father."
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
