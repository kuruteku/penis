require "./data"
require "./weapons"
require "./wojownici"
require "./materials"

class KostkaHerni

  attr_reader :sides
  def initialize(sides)
    @sides = sides
  end

  def roll
    Random.rand(1..@sides)
  end

end

class Arena
  def initialize(wojownik_1,wojownik_2)
    rondom = Random.rand(0..1)
    if rondom < 1
      @wojownik_1 = wojownik_1
      @wojownik_2 = wojownik_2
    else
      @wojownik_1 = wojownik_2
      @wojownik_2 = wojownik_1
    end
  end

  def fight

    puts @wojownik_1.info
    puts "\n"
    puts @wojownik_2.info

    while @wojownik_1.alive? && @wojownik_2.alive?

      gets.chomp
      puts "#{@wojownik_1.name} is attacking #{@wojownik_2.name} using #{@wojownik_1.weapon.name}."
      gets.chomp

      @wojownik_1.attack(@wojownik_2)
      if @wojownik_2.alive?

        puts "#{@wojownik_2.name} is attacking #{@wojownik_1.name} back using #{@wojownik_2.weapon.name}."
        gets.chomp

        @wojownik_2.attack(@wojownik_1)

      end

      puts "#{@wojownik_1.name}'s weapon is at #{@wojownik_1.weapon.durability} durability points."
      puts "#{@wojownik_1.name}: #{@wojownik_1.hit_points_graphic}"
      puts "#{@wojownik_2.name}'s weapon is at #{@wojownik_2.weapon.durability} durability points."
      puts "#{@wojownik_2.name}: #{@wojownik_2.hit_points_graphic}"

    end
  end
end

Dane.instance.init

dice = KostkaHerni.new(23)

penis = Miecz.new(material:Materials.get_melee_material("halbium"))

dan = KogutWalki.new(dice:dice,hit_points:669,strength:100,defense:10,luck:23,weapon:penis)

pyj = Miecz.new(material:Materials.get_melee_material("bronze"))

gay = KogutWalki.new(dice:dice,hit_points:1000,strength:25,defense:50,luck:5,weapon:pyj)

arena = Arena.new(dan,gay)
arena.fight