require './APIModule.rb'
require './Command.rb'

class NumbersProxy
  include APIProxy
  include Command
  def initialize
    @response = "Could not reach http://numbersapi.com/"
    build_uri()
  end

  def build_uri
    @uri = "http://numbersapi.com/" + Date.today().month.to_s + "/" + Date.today().day.to_s + "/date"
  end

  def parse_response
    #this API's response isn't a JSON object.
  end

  def print_response
    puts @response
  end


  #connect is in the module.
end
