require 'discordrb'
config = File.foreach('config.txt').map { |line| line.split(' ').join(' ') }
bottoken = config[0].to_s
bot = Discordrb::Commands::ComandBot.new token: "#{bottoken}", client_id: "#{config[1].to_s}", prefix: "#{config[2].to_s}",

bot.message(content: 'ping') do |event|
   event.respont 'Pong!'
end    
at_exit ( bot.stop )
bot.run
