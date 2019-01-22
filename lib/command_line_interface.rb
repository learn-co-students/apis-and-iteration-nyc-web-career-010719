def welcome
  puts "Welcome to the Star Wars API!"
end

def movie_choice
  puts "please enter a film name: "
  film = gets.chomp.downcase
  info = get_film_info_from_film_name(film)
  print_film_info(info)
end

def character_choice
  puts "please enter a character name: "
  character = gets.chomp.downcase
  movies = get_character_movies_from_api(character)
  print_movies(movies)
end

def get_info_from_user
  puts "please select 1 or 2 if you want to search for 1. character names or 2. film names: "
  choice = gets.chomp.downcase
  if choice == "1"
    character_choice
  elsif choice == "2"
    movie_choice
  else
    puts "Please put in 1 or 2!"
    get_info_from_user
  end

  # use gets to capture the user's input. This method should return that input, downcased.
end
