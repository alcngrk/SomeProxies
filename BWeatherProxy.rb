require './APIModule.rb'
require './Command.rb'

class BWeatherProxy
  include APIProxy
  include Command
  def initialize
    @response = "Could not reach https://www.metaweather.com."
    build_uri()
  end

  def build_uri
    @date = [Date.today().year.to_s, Date.today().month.to_s, Date.today().day.to_s]
    @uri = "https://www.metaweather.com/api/location/2459269/"+ @date[0] + "/" + @date[1] + "/" + @date[2]
  end

  def connect()
    begin
      open(@uri){ |f|
        @response = parse_response(f.read)
      }
      log_responses()
    rescue
      puts @response
      log_responses()
    end
  end

  def print_response
    puts @response
  end

  def parse_response(response)
    return JSON.parse(response)["weather_state_name"]
  end
end
