require './library.rb'

NAMES = ["Daniel Malý","Daniel Píro","Kryštof Korecký","Stanislav Novák","Martin Canale"]

def rape
  rape_subject = Gay.new(NAMES[Random.rand(0..NAMES.length-1)], Random.rand(0..150))
  puts "You are going to rape #{rape_subject.to_s} with the IQ of #{rape_subject.iq_extractor}"
  PLAYER.rape_repeatedly(rape_subject)
end

def status
    puts "Your name: #{PLAYER.to_s}"
    puts "Your IQ: #{PLAYER.iq_extractor}"
    puts "Your strength: #{PLAYER.strength}"
end

puts "Welcome to The Rapegame Alpha!\n\nCreate your own gay to begin the hunt!"
puts "\nName: "
name = gets.chomp
puts "Your gay's IQ: "
iq = gets.chomp
while !iq.is_number?
  puts "#{iq} is not a number jerk!"
  puts "Your gay's IQ: "
  iq = gets.chomp
end
puts "Let the hunt begin!"
PLAYER = Dan.new(name, iq, Random.rand(1..20))
exit = false
while !exit
  puts "Type 'rape' to rape, 'status' to show the bio of your gay or 'exit' to exit"
  command = gets.chomp
  case command
  when "rape"
    rape
  when "status"
    status
  when "exit"
    exit = true
  else
  puts "Unknown command nasrat"
  end
end