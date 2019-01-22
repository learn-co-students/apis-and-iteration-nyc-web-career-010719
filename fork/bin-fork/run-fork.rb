#!/usr/bin/env ruby

require_relative "../lib-fork/api_communicator-fork.rb"
require_relative "../lib-fork/command_line_interface-fork.rb"

welcome
character = get_character_from_user
show_character_movies(character)
