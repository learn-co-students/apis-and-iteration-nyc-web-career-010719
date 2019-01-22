# require 'rest-client'
# require 'json'
# require 'pry'
#
# def find_character_hash(response_hash, character_name)
#   response_hash["results"].find do |character|
#     character["name"].downcase == character_name
#   end
# end
#
# def find_film_hash(response_hash, film_title)
#   response_hash["results"].find do |film|
#     film["title"].downcase == film_title
#   end
# end
#
# def get_film_info(film_urls)
#   film_urls.map do |film|
#     film_string = RestClient.get(film)
#     JSON.parse(film_string)
#   end
# end
#
# def get_character_info(character_urls)
#   character_urls.map do |character|
#     character_string = RestClient.get(character)
#     JSON.parse(character_string)
#   end
# end
#
# def get_character_movies_from_api(character_name)
#   response_string = RestClient.get('http://www.swapi.co/api/people/')
#   response_hash = JSON.parse(response_string)
#
#   character_hash = find_character_hash(response_hash, character_name)
#   get_film_info(character_hash["films"])
# end
#
# def get_movie_characters_from_api(film_title)
#   response_string = RestClient.get('http://www.swapi.co/api/films/')
#   response_hash = JSON.parse(response_string)
#
#   film_hash = find_film_hash(response_hash, film_title)
#   get_character_info(film_hash["characters"])
# end
#
# def print_characters(characters)
#   characters_array = characters.map do |character|
#     character["name"]
#   end
#
#   puts characters_array
# end
#
# def print_movies(films)
#   films_array = films.map do |film|
#     film["title"]
#   end
#
#   puts films_array
# end
#
# def show_movie_characters(film_title)
#   characters = get_movie_characters_from_api(film_title)
#   print_characters(characters)
# end
#
# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   print_movies(films)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
