require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 
"token", prefix: "p#"
#Ping! 
bot.message(content: 'p#ping') do |event|
   event.respond "🏓Pong!🏓 Mój ping wynosi #{Time.now - event.timestamp} sekund."
end
#Help
bot.command :commands do |event|
   event.respond "**Pomoc**
  p#ping - Pokazuje ci ping bota
  p#lucario - wysyła ci gif z lucario
  p#info - dostajesz info o bocie 
  p#wiki - pokazuje ci wiki pokemonów
  p#iq - pokazuje twoje iq
  p#owner MalixoN - wysyła ci info o xMalixoNeQ
  p#owner Toothless - wysyła ci info o X_x_Toothless_x_X
  p#moneta - orzeł lub reszka 
  p#pytanie <pytanie> - zadaj pytanie botowi, odpowie tak lub nie
   
**Developerskie komendy:**
  p#stop - zatrzymuje bota"
end  
#info command
bot.message(with_text: "p#info") do |event|
  event.respond "**Twórcy bota**
  xMalixoNeQ#0832 | X_x_Toothless_x_X#5580

**Wersja *discordrb* : 3.4.0**
**Wersja *Ruby* : 2.7.2**

Serwer support: https://discord.gg/S7ZrUxQgJp"
end 
#dev command
bot.message(content: 'p#stop') do |event|
  break unless event.user.id == 701121808513892402
  bot.send_message(event.channel.id, 'Bot się wyłącza!')
  exit
end

bot.message(content: 'p#lucario') do |event|
   luc1 = "https://tenor.com/view/pokemon-lucario-gif-4906942"
   luc2 = "https://tenor.com/view/pokemon-anime-lucario-mega-lucario-punch-gif-17574451"
   luc3 = "https://tenor.com/view/pokemon-lucario-anime-power-attack-gif-17179313"
   luc4 = "https://tenor.com/view/pokemon-crying-lucario-gif-6177442"
   luc = [luc1, luc2, luc3, luc4].sample
   event.respond luc 
end    
bot.message(content: "p#wiki") do |event| 
   event.respond "https://pokemon.fandom.com/pl/wiki/Pok%C3%A9mon_Wiki"
end 
bot.command :pytanie do |event|
  takczynie = ["tak", "pewnie", "chyba tak", "chyba nie", "nie", "nigdy", "DAJ MI SPOKÓJ"].sample
  event.respond takczynie
end
bot.message(with_text: "p#prank") do |event|
  event.respond "https://tenor.com/view/dance-moves-dancing-singer-groovy-gif-17029825"
end
bot.message(with_text: "p#iq") do |event|
  iq = rand(-1000..1000)
  event.respond "Twoje iq wynosi #{iq}!"
end
bot.message(content: 'p#owner MalixoN') do |event|
   event.respond "Proszę:
   Nick: xMalixoNeQ
   Data urodzenia: 27.02.#### ||Nie ma tak łatwo||
   Tag: 0832
   Ulubiony kolor: Czerwony
   Najlepszy przyjaciel: xNexo
   Coś o mnie: Otóż mam szynszyla i kota, choruję na cukrzycę od 3 roku życia. 
   Ma dziewczynę: ||Nie||
   Zainteresowania: Pokemony"
end 
bot.message(content: 'p#owner Toothless') do |event|
   event.respond "Proszę:
   Nick: X_x_Toothless_x_X
   Data urodzenia: 26.02.#### ||Nie ma tak łatwo||
   Tag: <WPISZ>   
   Ulubiony kolor: <WPISZ>
   Najlepszy przyjaciel: <WPISZ>
   Coś o mnie: <WPISZ> 
   Ma dziewczynę: <WPISZ>
   Zainteresowania: <WPISZ>"
end   
bot.message(content: "p#moneta") do |event|
   monetalos = ["orzeł", "reszka"].sample
   event.respond monetalos
end 
bot.ready() do |event|
   bot.playing = " Pikabot | Support "
end   

bot.run
