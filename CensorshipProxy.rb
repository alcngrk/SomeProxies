require './APIModule.rb'
require './Command.rb'
require 'net/http'

class CensorshipProxy
  include APIProxy
  include Command

  def initialize(input)
    @input = input
    @response = "Could not reach http://127.0.0.1:80/"
    build_uri()
  end

  def build_uri
    @uri = URI.parse("http://127.0.0.1:80/")  #This is for Mac pcs, replace it with 192.168.0.1 for windows.
  end

  def connect
    begin
      @header = {'Content-Type': 'application/json'}
      @text = {text: @input}

      @http = Net::HTTP.new(@uri.host, @uri.port)
      @request = Net::HTTP::Post.new(@uri.request_uri, @header)
      @request.body = @text.to_json

      @response = @http.request(@request).body
      parse_response(@response)
      log_responses()
    rescue
      puts @response
    end
  end

  def parse_response(response)
    @response = JSON.parse(response)["text"]
  end

  def print_response
    puts @response
  end
end
