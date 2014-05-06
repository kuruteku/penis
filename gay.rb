require 'observer'

class FapObserver < Observable
  
end


class Penis
  include Observable
  
  attr_reader :gay
  def initialize(penis)
    @gay = penis
  end
  def porn(hure)
    changed
    notify_observers(hure)
  end
end

class Pyj < Penis
  def get_gay_from_pyj
    @gay
  end
end

class Notifap
  def update(hure)
    puts "dan is gay!! #{hure}"
  end
  def fap(k)
    puts "dan is homo!!"
  end
end

penis = Penis.new(23)
pyj = Pyj.new(69)

penis.add_observer(Notifap.new, :update)
penis.add_observer(Notifap.new, :fap)

puts "GAY"
puts penis.gay
puts pyj.get_gay_from_pyj
penis.porn("Mária je kurva")
