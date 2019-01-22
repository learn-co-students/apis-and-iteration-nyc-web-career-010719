def welcome
  "Welcome to the Star Wars API. Force joke!"
end

def get_character_from_user
  puts "Please enter a character name"
  character = gets.chomp.downcase
end

def get_film_from_user
  puts "Please enter a film name"
  film = gets.chomp.downcase
end
