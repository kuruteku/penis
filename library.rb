class String
  def is_number?
    true if Float(self) rescue false
  end
end

class Gay
  def iq_extractor
    @iq
  end
  def self.get_virgin_info(gay)

    if gay.virgin?
      return "#{gay.to_s} is a virgin"
    else
      return "#{gay.to_s} is not a virgin"
    end

  end

  def virgin?
    return @virgin
  end

  def got_raped(raped_by)
    puts "[#{@name}] I was raped by #{raped_by.to_s}"
    @virgin = false
    puts Gay.get_virgin_info(self)
  end

  def to_s
    return @name
  end

  def penis
    "#{@name} #{@iq.to_s}"
  end

  def is_gay?
    return true
  end

  def initialize(name, iq)
    @name = name
    @iq = iq
    @virgin = true
  end

end

class Dan < Gay
  def rape_once(gay)
    if (0..@strength).member?(Random.rand(1000))
      @strength += 5
      rape(gay)
      puts "#{self.to_s} has successfully raped #{gay.to_s}"
    return true
    else
      puts "#{self.to_s} has failed trying to rape #{gay.to_s}!"
      @strength += 1
    return false
    end

  end

  def rape_repeatedly(gay)
    tries = 0
    loop do
      tries += 1
      puts "#{tries}. try"
      break if rape_once(gay)
    end
  end

  def rape_repeatedly_tries(gay, max_tries)
    tries = 0
    loop do
      tries += 1
      puts "#{tries}. try"
      break if rape_once(gay) || tries > max_tries
    end
  end

  def rape(toberaped)
    puts "[#{self.to_s}] I am going to rape #{toberaped.class} #{toberaped.to_s}"
    toberaped.got_raped(self)
  end
  private :rape

  def initialize(name, iq, strength)
    super(name, iq)
    @strength = strength
  end

end