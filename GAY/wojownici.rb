require "./data"

class Wojownik
  attr_reader :name, :hit_points, :strength, :defense, :luck, :weapon
  def initialize(attributes)
    @name = attributes[:name]
    @dice = attributes[:dice]
    @max_hit_points = attributes[:hit_points]
    @hit_points = attributes[:hit_points]
    @strength = attributes[:strength]
    @defense = attributes[:defense]
    @luck = attributes[:luck]
    @weapon = attributes[:weapon]
  end
  
  def info
    return "#{@name}\nHealth: #{@hit_points}\nStrength: #{@strength}\nDefense: #{@defense}\nLuck: #{@luck}\nWeapon: #{@weapon.info}"
  end

  def alive?
    @hit_points > 0
  end

  def defend(attacker,strength,type)
    if alive?
      luck = Random.rand(@luck - @defense..@luck)
      compensation = @hit_points / strength
      luck += Random.rand(-(@dice.roll*compensation)..(@dice.roll*compensation))
      luck += @defense
      strength -= luck
      if strength > 0
        @hit_points -= strength
      end
    else
      return false
    end
  end
  
  def hit_points_graphic
    length = 20
    counter = @hit_points / (@max_hit_points / length)
    text = String.new
    
    text << '['
    length.times do
      if counter > 0
        text << 'X'
        counter -= 1
      else
        text << ' '
      end
    end
    text << ']'
    return text
    
  end
  
end

class KogutWalki < Wojownik
  def initialize(attributes)

    if attributes[:name]
      name = attributes[:name]
    else
      name = Dane.instance.names.sample
    end

    attributes[:name] = name
    super(attributes)

  end
  
  def attack(target)
    if alive?
      luck = Random.rand(@luck - @strength..@luck)
      luck += @weapon.strength
      luck += @strength
      
      
      if target.defend(self,luck,@weapon.attack_type)
        @weapon.use
      end
    end
    
  end
end
