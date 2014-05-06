require "singleton"

class Dane
  include Singleton
  def init
    @sword_first = ["Poskramiacz","Gwałt","Szlifierka","Tasak","Młynek","Tartak"]
    @sword_second = ["Penisowy","Wszechmocny","Warlatovy","Niezwyciężony","Gumowy"]
  end

  def names
    return ["Dan","Píro","Canale","Rak","Zymonová","Ender Dragon","Creeper","Jolanda","Kuruteku_09","Keralis","Miley Cyrus","Mumbo","Mike Shinoda","Lindsey Stirling","Superpennys139","Herout","Nemčoková","Sakalová","Štěpánek","Anonymní gynekolog","Prezident Semen","Andršová","Exner","Nina Nováková","Justin Bieber","Roko","Metrix","SethBling","Dragnoz","Kuchařka od okýnka číslo dvě","Hospodářka","Svatá trojce","Adam Urbánek","Ivon Humberlát","Kryštof Kory Korecký","Cendrb","Martin Beňo"]
  end

  def sword
    return "#{@sword_first.sample} #{@sword_second.sample}"
  end
end

