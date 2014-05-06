class Materials
  def self.initialize
    @@melee_materials = [Material.new("paper",1..5,1..2),Material.new("wood",6..11,3..10),Material.new("lead",12..18,11..18),Material.new("aluminium",19..25,19..22),Material.new("tin",26..35,23..29),Material.new("copper",36..49,30..42),Material.new("brass",50..67,43..58),Material.new("iron",68..81,59..80),Material.new("iridium",82..99,81..95),Material.new("steel",100..146,96..134),Material.new("bronze",147..169,135..156),Material.new("chromium",170..181,157..172),Material.new("titanium",182..205,173..198),Material.new("ruby",206..243,199..231),Material.new("diamond",244..269,232..286),Material.new("adamantium",270..428,287..396),Material.new("unobtainium",429..746,397..748),Material.new("halbium",747..2147483647,749..2147483647)]
    @@bow_materials = []
    @@staff_materials = []

  end

  def self.get_melee_material(name)
    
    Materials.initialize
    @@melee_materials.each do |material|
      if material.name == name
        return material
      end
    end
  end

end

class Material
  attr_reader :name, :strength_range, :durability_range
  def initialize(name,strength_range,durability_range)
    @name = name
    @strength_range = strength_range
    @durability_range = durability_range
  end

  def material?(durability,strength)
    return @durability_range.inclune?(durability) && @strength_range.inclune?(strength)
  end
end