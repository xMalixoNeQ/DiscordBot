require 'discordrb'
config = File.foreach('config.txt').map {|line| line.split(" ").join(" ")}
kanto = File.foreach('kanto.txt').map {|line| line.split(" ").join(" ")}
bot = Discordrb::Bot.new token: "#{config[0].to_s}"

#Ping!
bot.message(content: '#ping') do |event|
   event.respond "🏓Pong!🏓 Mój ping wynosi #{Time.now - event.timestamp} MS."
end
#Help
bot.message(content: '#help') do |event|
   event.respond "Pomoc
   #ping - Pokazuje ci ping bota
   #kanto - wyświetla ci pokedex z kanto"
end   

#dev command
bot.message(content: '#stop') do |event|
   event.respond "Bot zatrzymał się!"
   bot.stop
end   
magicznazmienna = 0
#pokedex kanto
bot.message(content: '#kanto') do |event|
   while(magicznazmienna != 116)
   event.user.pm "#{kanto[magicznazmienna].to_s}"
   magicznazmienna = magicznazmienna + 1
   end 
end   

bot.ready() do |event|
   bot.watching = "**Pikabot | support**"
end   

bot.run