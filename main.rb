require './options.rb'
require './CensorshipProxy.rb'
require './BWeatherProxy.rb'
require './NumbersProxy.rb'

def main
  commander = Options.new()

  puts "Write a fucking good morning message, asshole."
  input = gets.chomp
  commander << CensorshipProxy.new(input)
  commander << BWeatherProxy.new
  commander << NumbersProxy.new

  commander.execute
end

main
