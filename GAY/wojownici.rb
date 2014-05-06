require "./data"
require "observer"

class Wojownik
  include Observable
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
    @broke_weapon = true
  end

  def info
    return "#{@name}\nHealth: #{@hit_points}\nStrength: #{@strength}\nDefense: #{@defense}\nLuck: #{@luck}\nWeapon: #{@weapon.info}"
  end

  def alive?
    @hit_points > 0
  end

  def defend(attacker,strength,type)
    if alive?

      luck = Random.rand(@luck / 4..(@luck / 2) + @defense)

      compensation =  (strength.to_f / 15.0 )

      luck += Random.rand(1..(@dice.roll*compensation))

      luck += @defense

      strength -= luck

      if strength > 0
        @hit_points -= strength
      end
      return true
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
      luck = Random.rand(@luck / 4..(@luck / 2) + @strength)
      luck += @weapon.strength
      luck += @strength

      if target.defend(self,luck,@weapon.attack_type) && !@weapon.broken?
      @weapon.use
      end
      
      if @weapon.broken? && @broke_weapon
        @broke_weapon = false
        changed
        notify_observers("#{@name} broke his weapon!")
      end
      
    end

  end
end
