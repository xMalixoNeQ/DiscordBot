require 'discordrb'

bottoken = "token-here"
botprefix = "p#"


bot = Discordrb::Commands::CommandBot.new token: "#{bottoken}", prefix: "#{botprefix}"

#Ping! 
bot.command(:ping, description: 'Pong!') do |event|
  warn("WARN: Użyto komendy ping")
   event.respond "🏓Pong!🏓 Mój ping wynosi #{Time.now - event.timestamp} sekund."
end
#Help
bot.command :help do |event|
  warn("WARN: Użyto komendy help")
   event.respond "**Pomoc**
  p#ping - Pokazuje ci ping bota
  p#info - dostajesz info o bocie 
  p#wiki - pokazuje ci wiki pokemonów
  p#iq - pokazuje twoje iq
  p#moneta - orzeł lub reszka 
  p#pytanie <pytanie> - zadaj pytanie botowi, odpowie tak lub nie
  p#ship - shipuje cie i to co wpisałes lub oznaczoną osobę
  p#say - bot powie co ty
  p#meme - wysyła ci mema
  p#pociesz - bot cię pociesza
  p#nuke - niszczy serwer
  p#zapros - daje link do bota
  p#anime - wysyła randomowe zdjęcie anime
  
  **WAŻNE**
  p#clear - czyści chat z danej liczby wiadomości
  
  **OGŁOSZENIA**
  Pierwowity właściciel i założyciel na pewien długi czas oddał swojego bota dla najlepszego kumpla"

end  
#info command
bot.command(:info, description: 'Info o bocie i nie tylko') do |event|
  warn("WARN: Użyto komendy info")
  event.respond "**Twórcy bota**
  xMalixoNeQ#0832 | X_x_Toothless_x_X#5580
**Wersja bota : v1.1**
**Wersja *discordrb* : 3.4.0**
**Wersja *Ruby* : 2.7.2**

**Bot jest na #{bot.servers.count} serwerach!**

Serwer support: https://discord.gg/juHCQwJMx2" 
end 
#dev command
bot.message(content: 'p#stop') do |event|
warn("WARN: Użyto komendy stop")
  if event.user.id == 701121808513892402
  bot.send_message(event.channel.id, 'Bot się wyłącza!')
  exit
  elsif event.user.id == 802887784968749098
  bot.send_message(event.channel.id, 'Bot się wyłącza!')
  exit
  elsif event.user.id == 820623678471143425
    bot.send_message(event.channel.id, 'Bot się wyłącza!')
  exit
  else
    event.respond "NIE MASZ UPRAWNIEŃ!"
  end
end    
bot.command(:wiki, description: 'link do pokemon wiki') do |event|
  warn("WARN: Użyto komendy wiki") 
   event.respond "https://pokemon.fandom.com/pl/wiki/Pok%C3%A9mon_Wiki"
end 
bot.command :pytanie do |event|
  warn("WARN: Użyto komendy pytanie")
    takczynie = ["tak", "pewnie", "chyba tak", "chyba nie", "nie", "nigdy", "DAJ MI SPOKÓJ"].sample
    event.respond takczynie
end

bot.command :iq do |event|
  warn("WARN: Użyto komendy iq")
  iq = rand(-10000..10000)
  event.respond "Twoje iq wynosi #{iq}!"
end
  
bot.command :moneta do |event|
  warn("WARN: Użyto komendy moneta")
   monetalos = ["orzeł", "reszka"].sample
   event.respond monetalos
end 
bot.mention do |event|
  warn("WARN: Pingnięto bota")
  event.respond "Mój prefix to p# . Użyj komendy p#help"
end  
bot.command :anime do |event|
  warn("WARN: Użyto komendy anime")
  event.respond "https://ctk-api.herokuapp.com/neko/#{rand(1..500)}"
end  
#SHIP <3
bot.command :ship do |event, pos, dos|
  warn("WARN: Użyto komendy ship")
       
      pos = pos.gsub(" ", " ").to_s
      dos = dos.gsub(" ", " ").to_s

    event.channel.send_embed do |embed|
      shippercent = rand(0..100)
      embed.title = "SHIP <3" 
      embed.colour = 0xffff00
      embed.add_field(name: "Zobaczmy...", value: "#{pos} i #{dos} kochają się w #{shippercent}% !!!")
      embed.timestamp = Time.now
  end
end  
bot.command :say do |event, *message|
  warn("WARN: Użyto komendy say")
  copowiedz = message.join(" ")
  tencozrobil = event.user.name
  event.channel.prune 1, true
   event.channel.send_embed do |embed|
    embed.title = " "
    embed.colour = 0xffff00
    embed.add_field(name: "#{tencozrobil}:", value: "#{copowiedz}")
    embed.timestamp = Time.now
   end  
end 
bot.message(content: "p#meme") do |event|
warn("WARN: Użyto komendy meme")
  Rando = rand(1..500)
  event.respond("https://ctk-api.herokuapp.com/meme/#{Rando}")
end
bot.command :pociesz do |event|
  warn("WARN: Użyto komendy pociesz")
   event.respond "Nie martw się, jutro będzie lepiej."
end
bot.command :zapros do |event|
  warn("WARN: Użyto komendy zapros")
  event.respond "Masz:"
  event.respond "`https://discord.com/api/oauth2/authorize?client_id=811610668938559510&permissions=8&scope=bot`"
end  
bot.command :nuke do |event|
  warn("WARN: Użyto komendy nuke")
  event.respond "Spokój typie! Ja nie niszczę serwerów!"
end  
bot.ready() do |event|
   bot.playing = " Pikabot | Support "
end   
bot.command(:clear, permission_id: 8) do |event, amount|
  warn("WARN: Użyto komendy clear")
  amount = amount.to_i
  return "Możesz usunąć liczbę wiadomości od 1 do 100!" if amount > 100

  event.channel.prune amount, true
  event.respond "Zakończono! Usunięto #{amount} wiadomości 💥"
end

bot.run
