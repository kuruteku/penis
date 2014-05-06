require "singleton"

class KostkaHerni

  attr_reader :sides
  def initialize(sides)
    @sides = sides
  end

  def roll
    Random.rand(1..@sides)
  end

end

class Dane
  include Singleton
  def init
    @sword_first = ["Pogromca","Wibrator"]
    @sword_second = ["Penisowa","Wszechmocny"]
  end

  def names
    return ["Dan","Píro","Canale","Rak","Zymonová","Ender Dragon","Creeper","Jolanda","Kuruteku_09","Keralis","Miley Cyrus","Mumbo","Mike Shinoda","Lindsey Stirling","Superpennys139","Herout","Nemčoková","Sakalová","Štěpánek","Anonymní gynekolog","Prezident Semen","Andršová","Exner","Nina Nováková","Justin Bieber","Roko","Metrix","SethBling","Dragnoz","Kuchařka od okýnka číslo dvě","Hospodářka","Svatá trojce","Adam Urbánek","Ivon Humberlát","Kryštof Kory Korecký","Cendrb","Martin Beňo"]
  end

  def sword
    return "#{@sword_first.sample} #{@sword_second.sample}"
  end
end

class Bron

  attr_reader :name, :strength, :durability
  def initialize(attributes)
    @strength = attributes[:strength]
    @durability = attributes[:durability]
  end
  
  def use
    if @durability <= 0
      return false
    else
      @durability -= 1
      return true
    end
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
    super(attributes)

  end
end

class Wojownik

  attr_reader :name, :hit_points, :strength, :defense, :luck, :weapon
  def initialize(attributes)
    @name = attributes[:name]
    @dice = attributes[:dice]
    @hit_points = attributes[:hit_points]
    @strength = attributes[:strength]
    @defense = attributes[:defense]
    @luck = attributes[:luck]
    @weapon = attributes[:weapon]
  end
  
  def attack
    
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
end



Dane.instance.init

dice = KostkaHerni.new(23)

penis = Miecz.new(strength:69,durability:500000)

dan = KogutWalki.new(dice:dice,hit_points:69,strength:69,defense:69,luck:69,weapon:penis)
puts dan.name
puts dan.weapon.name
puts dan.weapon.durability
