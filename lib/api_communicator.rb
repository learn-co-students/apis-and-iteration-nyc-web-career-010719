require "JSON"
require "RestClient"
#It takes in an argument of a character's name (which gets passed to the method when it is called in the run.rb file) and relies on two helper methods that you will define to make a request to the API and parse the response from that request.
def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end
#get and parse for all
def api_grabber(api_link)
  response_string = RestClient.get(api_link)
  response_hash = JSON.parse(response_string)
end
#So, the get_character_movies_from_api method should return an array of hashes, where each hash represents a movie.
def get_character_movies_from_api(character)
  my_films = nil
  new_hash = api_grabber('http://www.swapi.co/api/people/')
  character_info = new_hash["results"]
  character_info.each do |characters|
    if characters["name"] == character
      my_films = characters["films"]
    end
  end
  my_films
end
#This array of hashes is what gets passed to the print_movies method. This is the method in which you will iterate over that array of hashes to puts out movie information to the terminal.
def print_movies(films_array)
  all_my_films = []
  films_array.each do |film|
    newer_hash = api_grabber(film)
    all_my_films << newer_hash
  end
  puts all_my_films
end
