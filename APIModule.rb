require 'open-uri'
require 'json'
require './log.rb'

module APIProxy
  def connect()
    begin
      open(@uri){ |f|
        @response = f.read
      }
      log_responses()
    rescue
      puts @response
      log_responses()
    end
  end

  def build_uri
    raise NotImplementedError
  end

  def parse_response
    raise NotImplementedError
  end

  def log_responses
    testlog = Log.instance
    Log.write_responses(@response)
  end
end
