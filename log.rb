require 'json'

class Log
  @@single = Log.new()
  def self.instance
    return @@single
  end


    @@file = File.open("responses.json", "w")
    @@file.puts("{")
    @@file.puts('"responses": [')
  def self.write_responses(response)
    @@file.puts(response.to_json + ',')
  end

  def self.finish_writing
    @@file.puts("]")
    @@file.puts("}")
    @@file.close()
  end
end
