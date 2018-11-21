require './log.rb'
class Options
  def initialize
    @proxies = []
  end

  def <<(proxy)
    @proxies << proxy
  end

  def execute
    @proxies.each{ |p|
      p.execute
    }
    Log.finish_writing
  end
end
