require "bundler"
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require "player"
require "application"
require "board"
require "board_case"
require "game"
require "show"

$my_game = Game.new
Application.new.perform
