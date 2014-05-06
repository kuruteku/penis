require "./data"


class Bron
  
  attr_reader :name, :strength, :durability, :type, :attack_type
  def initialize(attributes)
    
    @name = attributes[:name]
    @type = attributes[:type]
    @attack_type = attributes[:attack_type]
    @material = attributes[:material]
    @strength = Random.rand(@material.strength_range)
    @durability = Random.rand(@material.durability_range)
    
  end
  
  def use
    if @durability <= 0
      return false
    else
      @durability -= 1
     
      return true
    end
  end
  
  def info
    return "A powerful #{@type} made from #{@material.name} called #{@name} with the strength of #{@strength} and the durability of #{@durability}."
  end
  
  def broken?
    @durability <= 0    
  end
  
end

class Miecz < Bron
  def initialize(attributes)
    if attributes[:name]
      name = attributes[:name]
    else
      name = Dane.instance.sword
    end

    attributes[:name] = name
    attributes[:type] = "sword"
    attributes[:attack_type] = :melee
    
    super(attributes)
 

  end
end
