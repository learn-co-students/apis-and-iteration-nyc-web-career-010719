#!/usr/bin/env ruby
require "pry"
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
welcome
character = get_character_from_user
# binding.pry
show_character_movies(character)
binding.pry
"ay"
